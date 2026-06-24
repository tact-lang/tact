struct Example { a: Int; b: String; }

contract TestDestruct {
    // Test basic destructuring: binds both fields
    fun testBasic(e: Example): Int {
         let Example { a, b } = e;
         return a;
    }

    // Test renaming with discard operator: discard 'a', bind 'b'
    fun testDiscard(e: Example): String {
         let Example { a: _, b } = e;
         return b;
    }

    // Test ignoring extra fields with the '..' notation: binds field 'a' and ignores others
    fun testIgnore(e: Example): Int {
         let Example { a, .. } = e;
         return a;
    }

    receive() {}
}
