struct SimpleNested {
    val: Int;
}

struct DoubleNested {
    inner: SimpleNested;
}

struct TripleNested {
    middle: DoubleNested;
}

contract TestContract {
    deeply: TripleNested;
    init() {
        self.deeply = TripleNested{
            middle: DoubleNested{
                inner: SimpleNested{val:123}
            }
        };
    }
}