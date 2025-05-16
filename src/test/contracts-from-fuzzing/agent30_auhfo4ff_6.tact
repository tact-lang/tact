contract TestContract {
    fun build_concat(): String {
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello, ");
        sb = sb.concat("world!");
        return sb.toString();
    }

    fun build_append(): String {
        let sb: StringBuilder = beginString();
        sb.append("foo");
        sb.append("bar");
        return sb.toString();
    }

    fun compare_strings(): Int {
        let s1: String = "test";
        let s2: String = "test";
        return (s1 == s2) ? 1 : 0;
    }

    receive() {
        // Test 1: Basic string literal with escape sequences
        let s_basic: String = "Hello \"world\" \\ test \n new line";
        let dummy1: Slice = s_basic.asSlice();
        
        // Test 2: String concatenation via StringBuilder.concat
        let s_concat: String = self.build_concat();
        let dummy2: Slice = s_concat.asSlice();
        
        // Test 3: String building via StringBuilder.append
        let s_append: String = self.build_append();
        let dummy3: Slice = s_append.asSlice();
        
        // Test 4: String equality check in a function
        let eq_result: Int = self.compare_strings();
        
        // Test 5: Multi-lingual / Unicode string
        let s_unicode: String = "Привет, мир! 你好，世界！";
        let dummy4: Slice = s_unicode.asSlice();
        
        // Test 6: fromBase64 conversion
        let s_b64: String = "SGVsbG8sIFdvcmxkIQ=="; // "Hello, World!"
        let dummy5: Slice = s_b64.fromBase64();
    }

    // Test 7: Persistent field using ascii
    a: Int = ascii("abc");
}
