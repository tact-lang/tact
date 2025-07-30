struct OptionalDeeper {
    s: InnerMost?;
}

struct InnerMost {
    i: Int;
    flag: Bool;
}

contract OptDeep {
    data: OptionalDeeper;

    init() {
        self.data = OptionalDeeper{
            s: null
        };
    }
}
