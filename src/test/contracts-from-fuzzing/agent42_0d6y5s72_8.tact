const MY_ASCII: Int = ascii("A");

contract TestAsciiConstant {
    receive() {
        let x: Int = MY_ASCII;
    }
}
