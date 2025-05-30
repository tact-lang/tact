const asciiVal: Int = ascii("Hello");

contract Test {
    receive() {
        let a = asciiVal;
    }
}