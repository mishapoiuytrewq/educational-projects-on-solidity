// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Owner {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    struct user {
        string name;
        uint256 number;
        string adress;
    }

    mapping(string => user) public users;

    function setUser(
        string memory name,
        uint256 number,
        string memory adress
    ) public {
        require(msg.sender == owner, "Not owner");
        users[name] = user(name, number, adress);
    }

    function getUser(string memory name)
        public
        view
        returns (uint256 number, string memory adress)
    {
        require(msg.sender == owner, "Not owner");
        return (users[name].number, users[name].adress);
    }
}
