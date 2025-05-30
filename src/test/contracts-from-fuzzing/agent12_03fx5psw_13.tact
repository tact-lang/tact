const someRawSlice: Slice = rawSlice("");

contract Test {
    receive() {
        let s = someRawSlice;
    }
}