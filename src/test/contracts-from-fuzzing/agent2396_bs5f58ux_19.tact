struct NestedStr {
    n: Int;
    txt: String?;
}

contract MultiOpt {
    a: Int?;
    b: Bool?;
    c: NestedStr?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}