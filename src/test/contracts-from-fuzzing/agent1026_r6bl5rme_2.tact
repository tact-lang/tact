struct DeeplyNested {
    foo: Int;
}

struct Middle {
    nested: DeeplyNested;
    opt: Int?;
}

struct Top {
    m: Middle;
    bar: String;
    flag: Bool;
}

contract StoreDeep {
    data: Top;
    
    init() {
        self.data = Top{
            m: Middle{
                nested: DeeplyNested{ foo: 42 },
                opt: null,
            },
            bar: "ok",
            flag: true
        };
    }
}