struct MyStruct {
    s: String;
}

contract TestStructWithString {
    receive() {
        // Test usage of string within a struct and verify its value via conversion to Slice
        let ms: MyStruct = MyStruct { s: "StructStringTest" };
        // Using dump for runtime check of string content (asSlice comparison)
        if (ms.s.asSlice() == "StructStringTest".asSlice()) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
