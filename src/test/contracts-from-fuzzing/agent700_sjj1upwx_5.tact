struct NestedDeeper {
    f: Int;
}

struct NestedMiddle {
    nested: NestedDeeper;
    opt: String?;
}

struct NestedOuter {
    mid: NestedMiddle;
    flag: Bool;
}

contract ChainNested {
    state: NestedOuter;

    init() {
        self.state = NestedOuter{
            mid: NestedMiddle{
                nested: NestedDeeper{f:123},
                opt: null
            },
            flag: true
        };
    }
}