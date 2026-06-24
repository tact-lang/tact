const asciiVal: Int = ascii("Hello, 世界");

contract Test {
    receive() {
        let a = asciiVal;
    }
}