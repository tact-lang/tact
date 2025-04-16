struct NestedComplex {
    a: Int?;
    inner: InnerComplex;
}

struct InnerComplex {
    b: Bool?;
    str: String;
}

contract ComplexNestedStorage {
    data: NestedComplex;

    init() {
        self.data = NestedComplex{
            a: null,
            inner: InnerComplex{ b: null, str: "hello" }
        };
    }
}