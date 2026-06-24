struct InnerA {
    a: Int;
    b: Bool;
}

struct InnerB {
    c: String;
    d: Slice;
}

struct Outer {
    x: InnerA;
    y: InnerB;
    z: Bool;
}

contract NestedMultipleTypes {
    val: Outer;

    init() {
        self.val = Outer{
            x: InnerA{ a: 1, b: true },
            y: InnerB{ c: "test", d: emptyCell().asSlice() },
            z: false
        };
    }
}