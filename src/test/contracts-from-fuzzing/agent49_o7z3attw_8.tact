const RS: Slice = rawSlice("000DEADBEEF000");

contract Test {
    receive() {
        let s: Slice = RS;
    }
}
