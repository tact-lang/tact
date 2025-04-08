struct S {
    optStr: String?;
}

contract SimpleOptStruct {
    s: S;

    init() {
        self.s = S{ optStr: null };
    }
}