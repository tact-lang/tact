const MY_CONSTANT: Int = 42;

contract Test {
    receive() {
        let x: Int = MY_CONSTANT + 1;
    }
}
