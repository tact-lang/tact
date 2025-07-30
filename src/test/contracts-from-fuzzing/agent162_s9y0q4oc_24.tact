struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: S1;
    y: Int?;
}

contract NestedStructs {
    data: S2;

    init() {
        self.data = S2{
            x: S1{ a: 5, b: true },
            y: null
        };
    }
}