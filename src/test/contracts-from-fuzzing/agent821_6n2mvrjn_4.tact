struct ManyFields {
    i1: Int;
    i2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract TestManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            i1: 1,
            i2: 2,
            b1: true,
            b2: false,
            s1: "a",
            s2: "b",
            o1: null,
            o2: null,
            o3: null,
        };
    }
}