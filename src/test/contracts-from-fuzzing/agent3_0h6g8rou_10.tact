contract B(param: Int) {}

contract Test {
    receive() {
         let s = initOf B(42);
    }
}
