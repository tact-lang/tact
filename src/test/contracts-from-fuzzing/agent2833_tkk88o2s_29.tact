struct Level2Opts {
    foo: Int?;
    nested: NestedOpts?;
}

struct NestedOpts {
    bar: Bool?;
    text: String?;
}

contract OptInStructOpt {
    test: Level2Opts;

    init() {
        self.test = Level2Opts{
            foo: null,
            nested: null
        };
    }
}