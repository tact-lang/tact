struct BigNested {
    sub1: Sub1;
    sub2: Sub2;
}

struct Sub1 {
    x: Int;
    y: Bool;
    z: Sub3;
}

struct Sub2 {
    flag: Bool;
    msg: String;
}

struct Sub3 {
    n: Int?;
    s: String;
}

contract NestedLarge {
    field: BigNested;

    init() {
        self.field = BigNested{
            sub1: Sub1{
                x: 7,
                y: false,
                z: Sub3{ n: null, s: "test" }
            },
            sub2: Sub2{
                flag: true,
                msg: "hi"
            }
        };
    }
}
