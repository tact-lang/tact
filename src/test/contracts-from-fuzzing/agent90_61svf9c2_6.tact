fun testStringEquality() : Bool {
    return "Hello\nWorld" == "Hello\nWorld";
}

contract TestStringEquality {
    receive() {
        testStringEquality();
    }
}
