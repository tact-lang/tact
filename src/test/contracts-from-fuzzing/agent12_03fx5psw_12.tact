const someRawSlice: Slice = rawSlice("DEADBEEF");

contract Test {
    receive() {
        let s = someRawSlice;
    }
}