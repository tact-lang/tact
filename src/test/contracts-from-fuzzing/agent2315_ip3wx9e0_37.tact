struct Inner {
    foo: Int;
}

struct Outer {
    val: Inner = Inner{ foo: 5 };
}

contract StructDefaultExpr {
    data: Outer;
    init() {
        self.data = Outer{};
    }
}