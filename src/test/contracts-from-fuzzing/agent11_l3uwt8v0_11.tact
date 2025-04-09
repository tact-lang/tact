contract TestEmptyString {
    receive() {
        let s: String = "";
        let s_slice: Slice = s.asSlice();
        let s_back: String = s_slice.asString();
    }
}
