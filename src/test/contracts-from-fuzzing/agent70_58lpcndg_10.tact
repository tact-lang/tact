contract TestContract {
    receive() {
        let s1: String = "TactTest";
        let s2: String = "TactTest";
        dump(s1 == s2);
    }
}
