struct NestedS {
    s: String;
    inner: Int?;
}

contract TestNestedStructs {
    n1: NestedS;
    n2: NestedS;

    init() {
        self.n1 = NestedS{ s: "one", inner: null };
        self.n2 = NestedS{ s: "two", inner: 2 };
    }
}