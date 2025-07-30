contract EscapeSequenceTest {
    fun test(): Bool {
        let literal: String = "Line 1\nLine 2\tTabbed";
        return literal == "Line 1\nLine 2\tTabbed";
    }
}