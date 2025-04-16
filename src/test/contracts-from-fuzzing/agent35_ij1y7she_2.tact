struct Nested {
    a: Int;
    b: Int?;
    c: map<Int, Int>;
}

struct Outer {
    inner: Nested;
    d: Bool;
}

contract ComplexFields {
    complexData: Outer;

    init() {
        self.complexData = Outer{
            inner: Nested { a: 1, b: null, c: emptyMap() },
            d: true
        };
    }
}