struct Inner {
    s: String;
}

struct InnerOpt {
    s: String?;
}

struct Mid {
    x: Int;
    nested: Inner;
    nopt: InnerOpt;
}

contract MultipleNest {
    val: Mid = Mid {
        x: 1,
        nested: Inner{ s: "yo" },
        nopt: InnerOpt{ s: null },
    };

    receive() {
        self.val = self.val;
    }
}