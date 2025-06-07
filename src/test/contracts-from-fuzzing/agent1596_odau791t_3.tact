struct InnerMost {
    valA: Int;
    valB: Bool;
}

struct Middle {
    a: InnerMost;
    b: Int;
}

struct Outer {
    x: Int;
    y: Middle;
    z: Bool;
}

contract DeepNestedContract {
    field: Outer = Outer{
        x: 1,
        y: Middle{
            a: InnerMost{ valA: 42, valB: false },
            b: 2
        },
        z: true
    };
    receive() {
        let _ = self.field.y.a.valA;
    }
}