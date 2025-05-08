struct ManyFields {
    i1: Int;
    i2: Int;
    i3: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    opt1: Int?;
    opt2: String?;
}

contract WideStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            i1: 1,
            i2: 2,
            i3: 3,
            b1: true,
            b2: false,
            s1: "field1",
            s2: "field2",
            opt1: null,
            opt2: "maybe"
        };
    }
}