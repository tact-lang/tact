struct Outer {
    inner: StructInside?;
}

struct StructInside {
    val: Int;
}

contract NestedOpt {
    field: Outer;

    init() {
        self.field = Outer{ inner: StructInside{val:123} };
    }
}