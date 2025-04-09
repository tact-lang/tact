struct S {
    f1: String;
    f2: Bool?;
    f3: Int;
    f4: String?;
}

contract ComboFields {
    data: S;
    init() {
        self.data = S{ f1: "abc", f2: null, f3: 42, f4: null };
    }
}
