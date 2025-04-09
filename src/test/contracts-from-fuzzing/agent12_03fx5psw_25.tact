const tonVal: Int = ton("1000000000000000000");

contract Test {
    receive() {
        let t = tonVal;
    }
}