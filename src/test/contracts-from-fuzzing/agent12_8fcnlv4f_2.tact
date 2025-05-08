const asciiVal: Int = ascii("⚡");

contract TestAscii() {
    get fun getAscii(): Int {
        return asciiVal;
    }
    
    // A dummy receiver
    receive() {}
}
