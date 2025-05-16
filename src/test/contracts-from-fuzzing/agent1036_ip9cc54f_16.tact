struct HeavyNested {
    s1: Inner1;
    s2: Inner2;
    s3: Inner3;
}

struct Inner1 {
    i: Int;
    opt: Bool?;
}

struct Inner2 {
    str: String;
    addr: Address?;
}

struct Inner3 {
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice?;
}

contract NestedManyInner {
    data: HeavyNested;

    init() {
        self.data = HeavyNested{
            s1: Inner1{ i: 1, opt: null },
            s2: Inner2{ str: "str", addr: null },
            s3: Inner3{ cellVal: emptyCell(), builderVal: beginCell(), sliceVal: null },
        };
    }
}