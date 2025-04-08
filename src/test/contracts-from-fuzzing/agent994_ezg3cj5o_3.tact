struct DeepNest {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct MidNest {
    deep: DeepNest;
}

struct Top {
    middle: MidNest;
}

contract TestContract {
    nested: Top;

    init() {
        self.nested = Top{ middle: MidNest{ deep: DeepNest{ a:1, b:2, c:3, d:4, e:5 } } };
    }
}