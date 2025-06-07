struct SubSimple {
    a: Int;
    b: Bool;
}

struct SubWithOpt {
    c: Int?;
    d: Bool?;
}

struct VeryNested {
    main: SubSimple;
    alt: SubWithOpt;
}

contract NestedVariants {
    val: VeryNested;

    init() {
        self.val = VeryNested{
            main: SubSimple{ a: 10, b: true },
            alt: SubWithOpt{ c: null, d: null }
        };
    }
}
