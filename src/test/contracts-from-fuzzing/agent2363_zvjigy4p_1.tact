struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

struct DeepNested {
    inner: Nested;
    optionalInner: Nested?;
    flag: Bool;
}

contract StorageTest {
    n: Nested;
    d: DeepNested;
    optD: DeepNested?;

    init() {
        self.n = Nested{a: 1, b: true, c: "x"};
        self.d = DeepNested{inner: self.n, optionalInner: null, flag: false};
        self.optD = null;
    }
}