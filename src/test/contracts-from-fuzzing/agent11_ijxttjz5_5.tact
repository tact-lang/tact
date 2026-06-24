contract B(x: Int) {
    receive() {}
}

contract Tester2 {
    receive() {
         // Using initOf with a contract that has parameters; must supply parameter
         let s = initOf B(42);
    }
}
