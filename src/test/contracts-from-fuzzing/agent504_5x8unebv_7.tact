struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    s: S1;
    b: String;
}

contract NestedOptionalComplex {
    field: S2?;

    init() {
        self.field = S2{
            s: S1{
                x: 1,
                y: true,
            },
            b: "test",
        };
    }

    receive() {
        let t = self.field;
    }
}