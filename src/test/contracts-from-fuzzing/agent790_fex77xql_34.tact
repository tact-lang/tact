struct ABool {
    b: Bool;
}

struct IntWrap {
    v: Int;
}

struct Composite {
    a: ABool;
    i: IntWrap;
}

contract NestedMix2 {
    c: Composite;

    init() {
        self.c = Composite{a: ABool{b:true}, i: IntWrap{v:123}};
    }
}