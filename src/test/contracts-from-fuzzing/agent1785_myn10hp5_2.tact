struct DeepLeaf {
    id: Int;
    note: String;
}

struct Middle {
    leaf: DeepLeaf;
    optionalFlag: Bool?;
}

struct Root {
    middle: Middle;
    amount: Int;
}

contract ChainNested {
    rootField: Root;

    init() {
        self.rootField = Root{
            middle: Middle{
                leaf: DeepLeaf{ id: 7, note: "deep" },
                optionalFlag: null
            },
            amount: 777
        };
    }
}