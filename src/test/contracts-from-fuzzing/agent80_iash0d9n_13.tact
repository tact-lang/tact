// Fuzz-testing cycle for strings in Tact.
// This set of tests covers various string-related features including: 
// 1. Valid string literal usage
// 2. Escape sequences (\n, \t, \" etc.)
// 3. Conversion from String to Slice and back
// 4. StringBuilder concatenation and usage of ascii compile-time conversion
// 5. Base64 decoding via fromBase64
// 6. Empty string literal
// 7. Unicode string literal handling
// 8. Struct field initialization with String
// 9. String equality via hashData and usage inside control flow

// Test 1: Basic string literal and escape sequence test
fun testBasicAndEscape(): Int {
    // Use of simple string literal with escape sequences
    let s: String = "Hello,\nTact!\tIt\"s time";
    return s.hashData();
}

// Test 2: Conversion between String and Slice (round-trip)
fun testRoundTrip(): Int {
    let original: String = "TactFuzzRoundTrip";
    let slice: Slice = original.asSlice();
    let roundtrip: String = slice.asString();
    if (original.hashData() != roundtrip.hashData()) {
        // If round-trip conversion fails, throw error
        throw(1);
    }
    return 42;
}

// Test 3: Testing Base64 decoding of a valid Base64 string
fun testFromBase64(): Int {
    let b64: String = "SGVyZSdzIEpvaG5ueSE="; // Base64 for "Here's Johnny!"
    let slice1: Slice = b64.fromBase64();
    let slice2: Slice = b64.asSlice().fromBase64();
    if (slice1.hash() != slice2.hash()) {
        throw(1);
    }
    return 100;
}

// Test 4: Testing an empty string literal
fun testEmptyString(): Int {
    let empty: String = "";
    return empty.hashData();
}

// Test 5: Testing Unicode string literals
fun testUnicodeStrings(): Int {
    // Use of multiple Unicode characters
    let s: String = "⚡🔥😊";
    return s.hashData();
}

// Test 6: Testing string concatenation via StringBuilder and ascii compile-time conversion
fun testStringBuilderAndAscii(): Int {
    let sb: StringBuilder = beginString();
    sb.append("Concatenated");
    sb.append(" ");
    sb.append("String");
    let concatenated: String = sb.toString();

    // ascii compile-time function works on compile-time constant strings
    let asciiVal: Int = ascii("abc");
    // Sum the results as an arbitrary output
    return concatenated.hashData() + asciiVal;
}

// Test 7: Testing string usage as field in a struct and in control flow
struct MyStruct {
    s: String;
}

fun testStructAndControl(): Int {
    let ms: MyStruct = MyStruct { s: "StructStringTest" };

    // Use string equality (via hashData as a proxy) in a condition
    let literal: String = "StructStringTest";
    if (ms.s.hashData() == literal.hashData()) {
        return 1;
    } else {
        return 0;
    }
}

// Main contract integrating all tests
contract TestContract {
    // The receiver will execute several tests and dump their results
    receive() {
        dump(testBasicAndEscape());      // Test 1
        dump(testRoundTrip());             // Test 2
        dump(testFromBase64());            // Test 3
        dump(testEmptyString());           // Test 4
        dump(testUnicodeStrings());        // Test 5
        dump(testStringBuilderAndAscii()); // Test 6
        dump(testStructAndControl());      // Test 7
    }
}
