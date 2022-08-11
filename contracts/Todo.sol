// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
import "hardhat/console.sol";

contract Todo {
    struct todoObject {
        string todo;
        address owner;
        bool completed;
        uint256 id;
    }

    // uint256 private todoIndex  = 0;

    // mapping(address => todoObject[]) public s_todoListStorage;
    todoObject[] public todoList;

    // Events
    event NewTodo(address indexed from, uint256 timestamp, string todo);

    constructor() {
        console.log("Welcome to the smart contract.");
    }

    function addTodo(string memory _todo) public {
        // todoIndex +=1;
        // s_todoListStorage[msg.sender].push( todoObject(_todo, msg.sender,false,todoIndex));
        todoList.push(todoObject(_todo, msg.sender, false, todoList.length));
        emit NewTodo(msg.sender, block.timestamp, _todo);
    }

    function updateTodoStatus(uint256 _id, bool _completed) public {
        require(
            todoList[_id].owner == msg.sender,
            "You are not the owner of todo"
        );
        todoList[_id].completed = _completed;
    }

    function getTodos() public view returns (todoObject[] memory) {
        return todoList;
    }
}
