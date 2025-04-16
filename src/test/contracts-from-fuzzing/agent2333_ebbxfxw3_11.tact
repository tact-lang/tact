struct InnerA {
    foo: Int;
}
struct InnerB {
    bar: Bool;
}
struct Combined {
    a: InnerA;
    b: InnerB;
}

contract TestStructComposition {
    val: Combined;
    init() {
        self.val = Combined{
            a: InnerA{ foo: 1 },
            b: InnerB{ bar: true }
        };
    }
}