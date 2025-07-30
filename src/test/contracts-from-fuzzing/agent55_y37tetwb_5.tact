const GLOBAL_CONSTANT: Int = 123;

contract Test {
    receive() {
         let x: Int = GLOBAL_CONSTANT;
    }
}
