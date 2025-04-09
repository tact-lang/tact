struct Mid {
    a: Int = 1;
    b: Bool = false;
}

struct Top {
    str: String;
    mid: Mid;
    optVal: Int?;
}

contract OptionalNested {
    val: Top = Top{
        str: "",
        mid: Mid{},
        optVal: null
    };

    init() {
        self.val = Top{
            str: "abc",
            mid: Mid{ a: 5, b: true },
            optVal: 42
        };
    }
}
