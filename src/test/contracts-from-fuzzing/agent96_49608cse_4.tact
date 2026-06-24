contract TestContract {
    receive() {
        // Testing Unicode characters in string literal
        let s: String = "漢字テスト";
        let _slice: Slice = s.asSlice();
    }
}
