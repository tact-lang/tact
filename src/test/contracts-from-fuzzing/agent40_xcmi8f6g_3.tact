const MY_CONSTANT: Int = 42;

contract TestContract {
    receive() {
        let result: Int = MY_CONSTANT;
    }
}
