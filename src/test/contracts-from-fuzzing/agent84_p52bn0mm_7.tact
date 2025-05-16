struct MyStruct {
    s: String;
}

contract TestContract {
    ms: MyStruct = MyStruct { s: "Initial" };

    receive() {
        // Test 4: String literal in a struct field including an escape sequence, accessing field via self
        self.ms = MyStruct { s: "Struct String with escape: \n newline" };
        dump(self.ms.s);
    }
}
