// Test A: Trailing comma in contract parameters
contract TrailingContract(param: Int,) {
    receive() {}
}

contract TestTrailing {
    receive() {
         let x = initOf TrailingContract(100,);
         let y = codeOf TrailingContract;
    }
}
