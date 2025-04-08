struct Mixed {
    i: Int;
    s: String;
    b: Bool;
    o: Int?;
}

contract MixedFields {
    f: Mixed = Mixed{
        i: 1,
        s: "s",
        b: true,
        o: null
    };

    init() {
        self.f = Mixed{
            i: 2,
            s: "ss",
            b: false,
            o: 123
        };
    }
}