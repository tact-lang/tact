struct InnerMost {
    val: Int;
    note: String;
}

struct Middle {
    in1: InnerMost;
    flag: Bool;
    txt: String;
}

struct Outer {
    mid: Middle;
    extra: Int;
}

contract MultipleNests {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: Middle{
                in1: InnerMost{ val: 7, note: "deep" },
                flag: false,
                txt: "hello",
            },
            extra: 999,
        };
    }
}