contract StringSliceTest {
    receive() {
        let s: String = "Sample String";
        let slice: Slice = s.asSlice();
    }
}