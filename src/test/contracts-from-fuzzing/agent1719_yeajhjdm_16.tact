struct BigNested {
    a: Int;
    b: String;
    c: Int?;
    d: Bool;
    e: InnerBigNested;
}

struct InnerBigNested {
    x: Int;
    y: String?;
    z: Bool?;
}

contract NestedWithOptionals {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 5,
            b: "val",
            c: null,
            d: false,
            e: InnerBigNested{
                x: 1,
                y: null,
                z: null
            }
        };
    }
}