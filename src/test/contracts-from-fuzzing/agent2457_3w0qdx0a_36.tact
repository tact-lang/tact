struct SimpleNested {
    a:Int;
}

struct DoubleNested {
    inner: SimpleNested;
}

struct TripleNested {
    inner: DoubleNested;
}

contract TripleNestField {
    val: TripleNested;
    init() {
        self.val = TripleNested{ inner: DoubleNested{ inner: SimpleNested{a:42}}};
    }
}