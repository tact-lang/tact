struct NestedDeeper { inner1: Int; inner2: Bool; }

struct Outer {
    nested: NestedDeeper;
    flag: Bool;
    txt: String;
}

contract MultiLevelNested {
    out: Outer;

    init() {
        self.out = Outer{
            nested: NestedDeeper{ inner1: 42, inner2: true },
            flag: false,
            txt: "hi"
        };
    }
}