contract TestAsSlice {
    receive() {
        // Testing conversion from String to Slice and back to String
        let s: String = "Test string";
        let sliceVal: Slice = s.asSlice();
        let recovered: String = sliceVal.asString();
    }
}
