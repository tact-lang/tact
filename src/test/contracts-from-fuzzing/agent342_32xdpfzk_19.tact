struct DeepMulti {
    nested: OptionStruct;
    inner: Inner;
}

struct OptionStruct {
    a: Int?;
    b: Bool?;
}

struct Inner {
    x: Int;
    s: String;
}

contract Test18 {
    v: DeepMulti;

    init() {
        self.v = DeepMulti{
            nested: OptionStruct{
                a: 99,
                b: null,
            },
            inner: Inner{
                x: 5,
                s: "deep",
            },
        };
    }
}