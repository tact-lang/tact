struct InnerMost {
    a: Int;
}

struct MidOptional {
    value: InnerMost?;
}

struct OuterOptional {
    mid: MidOptional?;
}

contract OptionalMidOptional {
    outer: OuterOptional;

    init() {
        self.outer = OuterOptional{
            mid: null,
        };
    }

    receive() {
        let _ = self.outer;
    }
}