contract SliceStringTest {
    receive() {
        // Testing conversion from String to Slice and back to String
        let original: String = "Test string conversion";
        let slice: Slice = original.asSlice();
        let converted: String = slice.asString();
    }
}
