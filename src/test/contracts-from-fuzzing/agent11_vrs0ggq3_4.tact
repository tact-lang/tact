const MY_CONSTANT: Int = 42;

contract TestContract {
    receive() {
        let x: Int = MY_CONSTANT + 1;
    }
}
