struct Inner {
    val: Int;
    opt: Bool?;
}

struct Mid {
    embedded: Inner;
    optInner: Inner?;
}

struct Outer {
    level: Mid;
    maybeMid: Mid?;
}

contract NullableStructs {
    nested: Outer;

    init() {
        self.nested = Outer{
            level: Mid{
                embedded: Inner{ val:0, opt:null },
                optInner: null,
            },
            maybeMid: null,
        };
    }

    receive() {
        self.nested = self.nested;
    }
}