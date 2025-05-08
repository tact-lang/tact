struct S {
    i: Int;
    s: String;
    b: Bool;
}

contract MultiTypePersistent {
    data: S;
    init() {
        self.data = S{ i: 1, s: "s", b: true };
    }
}