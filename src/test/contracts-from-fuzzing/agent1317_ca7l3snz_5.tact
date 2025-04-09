struct OptionalDeep {
    level2: InnerDeep?;
}

struct InnerDeep {
    val: Int;
    next: InnerDeeper?;
}

struct InnerDeeper {
    flag: Bool;
}

contract OptionalDeepStorage {
    nested: OptionalDeep;

    init() {
        self.nested = OptionalDeep{
            level2: InnerDeep{
                val: 99,
                next: InnerDeeper{ flag: true }
            }
        };
    }
}