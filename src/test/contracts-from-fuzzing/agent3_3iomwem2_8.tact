///////////////////////////////////////////////////////////////
// Test 16: Message conversion and cell roundtrip
///////////////////////////////////////////////////////////////

message TestMsg {
    field: Int;
    info: String;
}

fun test_message_conversion() : Int {
    let m = TestMsg{ field: 10, info: "Hello" };
    let m2 = TestMsg.fromCell(m.toCell());
    // If m2.info equals "Hello", add 20 to m2.field; otherwise, return m2.field
    return m2.field + (m2.info == "Hello" ? 20 : 0);
}

// Expected result: 10 + 20 = 30
