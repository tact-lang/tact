struct BigNested {
    sub1: Sub1;
    sub2: Sub2;
}

struct Sub1 {
    x: Int;
    y: Bool?;
}

struct Sub2 {
    txt: String;
    z: Int?;
}

contract MultiNested {
    nested: BigNested;

    init() {
        self.nested = BigNested{
            sub1: Sub1{
                x: 5,
                y: null
            },
            sub2: Sub2{
                txt: "deep",
                z: null
            }
        };
    }
}