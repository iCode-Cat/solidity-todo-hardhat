// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  const Todo = await hre.ethers.getContractFactory('Todo');
  const todo = await Todo.deploy();
  await todo.deployed();

  const addTodo = await todo.addTodo('JUJU');
  await todo.addTodo('BUBU');
  await addTodo.wait();

  const todoList = await todo.getTodos();
  console.log(todoList);

  console.log('Todo deployed to:', todo.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
