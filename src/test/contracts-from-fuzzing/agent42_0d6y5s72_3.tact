const MY_CONSTANT: Int = 42;

contract TestConstant {
    receive() {
        let a: Int = MY_CONSTANT;
    }
}
