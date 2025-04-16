const GLOBAL_CONSTANT: Int = 42;

contract Test {
    receive() {
        let x: Int = GLOBAL_CONSTANT;
    }
}
