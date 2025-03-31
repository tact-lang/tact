contract StringEqualityTest {
    receive() {
        // Compare two string literals by converting them to slices
        let a: String = "test string";
        let b: String = "test string";

        // Using asSlice() for comparison since equality on Slice is supported
        if (a.asSlice() == b.asSlice()) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
