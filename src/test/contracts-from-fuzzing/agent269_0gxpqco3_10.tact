struct Inner {
    a: Int = 1;
    b: Bool = true;
}

struct Outer {
    c: Int = 2;
    d: Inner = Inner{};
}

contract OptNestedStruct {
    z: Outer? = null;

    init() {
        self.z = Outer{
            c: 100,
            d: Inner{ a: 50, b: false }
        };
    }
}