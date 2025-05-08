struct One { number: Int; }

fun testStruct() {
    // Create an instance of struct One
    let o: One = One { number: 10 };
    // Dump the field to verify its value
    dump(o.number);
}

fun main() {
    testStruct();
}
