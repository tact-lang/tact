contract TestContract {
    receive() {
        let s: String = "TON";
        let slice1: Slice = s.asSlice();
        let s2: String = slice1.asString();
        let eq: Bool = (s == s2);
    }
}
