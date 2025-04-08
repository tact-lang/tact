struct NestedOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct TopLevel {
    nested: NestedOpt;
    num: Int;
    flag: Bool;
}

contract OptStruct {
    data: TopLevel;
    init() {
        self.data = TopLevel{
            nested: NestedOpt{foo:null, bar:null, baz:null},
            num: 5,
            flag: true
        };
    }
}