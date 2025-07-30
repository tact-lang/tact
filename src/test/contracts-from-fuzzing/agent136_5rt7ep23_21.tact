struct InnerMost {
    a: Int;
}

struct InnerOpt {
    v: InnerMost?;
}

contract NestedStructOpt {
    field: InnerOpt;

    init() {
        self.field = InnerOpt{
            v: InnerMost{ a: 3 }
        };
    }
}