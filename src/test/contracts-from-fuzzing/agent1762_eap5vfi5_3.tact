struct DeepOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    nestedOpt: Other?;
}

struct Other {
    val: Int;
    flag: Bool;
}

contract Opts {
    stored: DeepOptional;
    init() {
        self.stored = DeepOptional{
            foo: null,
            bar: true,
            baz: null,
            nestedOpt: Other{ val: 1, flag: false }
        };
    }
}