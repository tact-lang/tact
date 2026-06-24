// Fuzz-testing Strings in Tact: Summary of Test Cases

// Test 1: Basic string literal
contract Test1 {
    receive() {
        let s: String = "Hello, Tact!";
    }
}

// Test 2: String literal with escape sequences (newline, tab, backslash, double quote, Unicode)
contract Test2 {
    receive() {
        let s: String = "Line1\nLine2\tTab\\Quote: \" and smiley: \u263A";
    }
}

// Test 3: Building string using StringBuilder and concatenating parts
contract Test3 {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("Tact!");
        let s: String = sb.toString();
    }
}

// Test 4: Invalid escape character; expecting a compile error
contract Test4 {
    receive() {
        // This snippet should fail to compile due to an invalid escape sequence (\q)
        // Uncommenting next line should trigger a compile error
        // let s: String = "Invalid escape: \q";
    }
}

// Test 5: Empty string (edge-case; valid behavior)
contract Test5 {
    receive() {
        let s: String = "";
    }
}

// Test 6: Using valid escape sequences including vertical tab (\v) if supported
contract Test6 {
    receive() {
        let s: String = "Vertical tab: \v";
    }
}

// Test 7: String equality in control flow
contract Test7 {
    receive() {
        if ("abc" == "abc") {
            let s: String = "equal";
        } else {
            let s: String = "different";
        }
    }
}

// Test 8: String literal concatenation using '+' operator (should fail as '+' is not defined for Strings)
contract Test8 {
    receive() {
        // This should trigger a compile error as direct '+' for Strings is disallowed.
        // Uncommenting next line should cause an error:
        // let s: String = "Hello" + " world";
    }
}

// Test 9: String literal inside a struct
struct Data {
    content: String;
}

contract Test9 {
    receive() {
        let d: Data = Data { content: "Struct string: \n newline and \t tab, plus a Unicode smiley: \u263A" };
    }
}

// Test 10: Converting a string to slice and back to string
contract Test10 {
    receive() {
        let s: String = "Roundtrip string \u263A Test";
        let s_slice: Slice = s.asSlice();
        let s_back: String = s_slice.asString();
        if (s == s_back) {
            // Roundtrip successful
        } else {
            // Unexpected: roundtrip failed
        }
    }
}

// Test 11: String.fromBase64 usage
contract Test11 {
    receive() {
        let s: String = "SGVyZSdzIEJhc2U2NCE="; // Base64 for "Here's Base64!"
        let sl: Slice = s.fromBase64();
    }
}
