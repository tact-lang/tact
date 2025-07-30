const MY_CONSTANT: Int = 42;

contract TestGlobalConst {
    receive() {
        let x: Int = MY_CONSTANT + 8;
    }
}
