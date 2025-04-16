contract TestAsSlice {
    receive() {
        let s: String = "Testing asSlice";
        let s_slice: Slice = s.asSlice();
        let s_recovered: String = s_slice.asString();
        dump(s_recovered);
    }
}
