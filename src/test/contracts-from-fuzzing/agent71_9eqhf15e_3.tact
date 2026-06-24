const MY_CONSTANT: Int = 42;

contract Test {
    receive() {
        let r: Int = MY_CONSTANT;
    }
}
