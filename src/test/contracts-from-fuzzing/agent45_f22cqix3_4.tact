const MY_CONSTANT: Int = 100;

contract TestContract {
    receive() {
        let x = MY_CONSTANT + 10;
    }
}
