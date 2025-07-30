const tonVal: Int = ton("1.5");

contract Test {
    receive() {
        let t = tonVal;
    }
}