struct TestStruct {
    txt: String;
}

contract TestStructWithString {
    receive() {
        // Testing that a string stored in a struct is correctly handled
        let s: String = TestStruct{ txt: "Struct string test" }.txt;
    }
}
