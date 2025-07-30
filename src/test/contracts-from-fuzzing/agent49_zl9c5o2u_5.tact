contract StringTest {
    // Test using String.asSlice on a string literal
    fun test(): Slice {
        return "Hello!".asSlice();
    }
}