struct SInner {
    x: Int;
    y: Bool;
    z: String;
}

struct SOuter {
    a: SInner;
    b: SInner;
}

contract MultiStructs {
    field: SOuter;

    init() {
        self.field = SOuter{
            a: SInner{
                x: 1,
                y: true,
                z: "a",
            },
            b: SInner{
                x: 2,
                y: false,
                z: "b",
            },
        };
    }
}
