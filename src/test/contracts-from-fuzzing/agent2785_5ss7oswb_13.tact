struct S {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract Test(
    s: S,
    o1: S?,
    o2: S?,
) {
    receive() {
        let _ = self.s.s1;
    }
}
