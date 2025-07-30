const tonVal: Int = ton("0");

contract Test {
    receive() {
        let t = tonVal;
    }
}