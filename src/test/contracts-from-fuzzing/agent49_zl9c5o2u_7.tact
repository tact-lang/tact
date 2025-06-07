contract StringTest {
    // Test string literal with hashData
    fun test(): Int {
        return "This is a test string".hashData();
    }
}