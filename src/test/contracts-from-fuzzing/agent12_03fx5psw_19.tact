const tonVal: Int = ton("");

contract Test {
    receive() {
        let t = tonVal;
    }
}