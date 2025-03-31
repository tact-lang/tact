struct MyStruct {
    s: String;
}

contract TestContract {
    ms: MyStruct = MyStruct { s: "Initial" };

    // Test 1: Basic string literal assignment
    fun testBasicLiteral() {
        let s: String = "Hello, world!";
        dump(s);
    }

    // Test 2: Escape sequences in string literals
    fun testEscapes() {
        // Includes newline, tab, backslash, and quote
        let s: String = "Escape: newline:\n, tab:\t, backslash:\\, quote:\"";
        dump(s);
    }

    // Test 3: Consistency of asSlice() and asString()
    fun testSliceRoundtrip() {
        let s: String = "Roundtrip Test";
        let t: String = s.asSlice().asString();
        if (s != t) {
            throw(1);
        }
        dump(t);
    }

    // Test 4: Using string literals in struct fields and field updates
    fun testStructString() {
        self.ms = MyStruct { s: "Struct String with escape: \n newline" };
        dump(self.ms.s);
    }

    // Test 5: Complex string literal combining Unicode and other escapes
    fun testComplexEscapes() {
        // \u{1F602} represents the 😂 emoji
        let a: String = "\u{1F602}\nTest \t Escape with \\ and \" quotes";
        dump(a);
    }

    // Test 6: Equality check between hex escape sequences and literal characters
    fun testHexEquality() {
        let s1: String = "\x61\x62\x63"; // Should be "abc"
        let s2: String = "abc";
        if (s1 != s2) {
            throw(1);
        }
        dump("Hex equality passed");
    }

    receive() {
        self.testBasicLiteral();
        self.testEscapes();
        self.testSliceRoundtrip();
        self.testStructString();
        self.testComplexEscapes();
        self.testHexEquality();
    }
}
