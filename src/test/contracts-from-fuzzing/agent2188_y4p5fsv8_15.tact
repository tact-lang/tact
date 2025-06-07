struct S1 {
    a: Bool;
    b: Int?;
}

struct S2 {
    x: Int;
    y: S1;
    z: Bool;
}

contract StructMidOpt {
    data: S2;
    init() {
        self.data = S2{
            x: 17,
            y: S1{
                a: false,
                b: null,
            },
            z: true,
        };
    }
}