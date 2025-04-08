struct InnerB {
    z: Int?;
    msg: String;
}

struct InnerA {
    b: Bool?;
    ib: InnerB;
}

struct Container {
    a: Int;
    ia: InnerA;
    flag: Bool;
}

contract OptionalDeepInside {
    cont: Container;

    init() {
        self.cont = Container{
            a: 1,
            ia: InnerA{
                b: null,
                ib: InnerB{
                    z: null,
                    msg: "test",
                }
            },
            flag: true,
        };
    }
}
