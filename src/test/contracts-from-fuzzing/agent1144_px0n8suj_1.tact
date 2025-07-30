struct Outer {
    inA: InnerA;
    flag: Bool;
}

struct InnerA {
    x: Int;
    b: Bool;
}

contract NestedStructContract {
    field: Outer;

    init() {
        self.field = Outer{
            inA: InnerA{ x: 42, b: true },
            flag: false
        };
    }
}