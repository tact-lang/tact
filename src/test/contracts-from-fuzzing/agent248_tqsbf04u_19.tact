struct LevelInner {
    foo: Int?;
    bar: String?;
}

struct LevelOuter {
    nested: LevelInner?;
    comment: String?;
}

contract MultiOptNest {
    opts: LevelOuter?;

    init() {
        self.opts = LevelOuter{
            nested: LevelInner{ foo: null, bar: "baz" },
            comment: null
        };
    }
}