struct S {
    a: String;
    b: String?;
    c: Bool;
}

contract StrBoolMix {
    val: S;
    init() {
        self.val = S{a: "a", b: null, c: false};
    }
}