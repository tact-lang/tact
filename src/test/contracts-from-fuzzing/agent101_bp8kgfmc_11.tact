struct Inner {
    a: Int;
}

struct Combo {
    x: Int;
    y: Bool?;
    z: String;
    innerOpt: Inner?;
}

contract ComplexStruct {
    data: Combo = Combo{
        x: 10,
        y: null,
        z: "start",
        innerOpt: null,
    };

    init() {
        self.data = Combo{
            x: 20,
            y: true,
            z: "updated",
            innerOpt: Inner{ a: 99 },
        };
    }
}