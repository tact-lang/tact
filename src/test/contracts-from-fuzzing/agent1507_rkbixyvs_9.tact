struct Ops {
    i: Int;
    optInt: Int?;
    b: Bool;
    optB: Bool?;
    s: String;
    optS: String?;
}

contract OptionalsMix {
    data: Ops;

    init() {
        self.data = Ops{
            i: 99,
            optInt: null,
            b: true,
            optB: false,
            s: "xyz",
            optS: null,
        };
    }
}
