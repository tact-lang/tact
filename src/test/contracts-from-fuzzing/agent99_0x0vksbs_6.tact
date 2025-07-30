contract TestContract {
    receive() {
        let s: String = "Life is beautiful";
        let slice: Slice = s.asSlice();
        dump(slice.asString());
    }
}
