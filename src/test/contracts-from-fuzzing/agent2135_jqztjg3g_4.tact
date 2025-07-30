struct InnerA {
    val: Int;
}

struct InnerB {
    inner: InnerA;
    flag: Bool;
}

struct Outer {
    b: InnerB;
    another: Int;
}

contract DeepNestedStructs {
    field: Outer;

    init() {
        self.field = Outer{b: InnerB{inner: InnerA{val: 1}, flag: false}, another: 42};
    }
}