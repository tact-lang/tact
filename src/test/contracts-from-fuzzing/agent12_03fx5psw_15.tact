const asciiVal: Int = ascii("A");

contract Test {
    receive() {
        let a = asciiVal;
    }
}