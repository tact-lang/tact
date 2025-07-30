struct OptsNested {
    one: Int?;
    two: Bool?;
}

struct DeeperOpts {
    a: OptsNested;
    b: OptsNested;
}

contract OptionsDeep {
    store: DeeperOpts;
    init() {
        self.store = DeeperOpts{
            a: OptsNested{ one: null, two: null },
            b: OptsNested{ one: 123, two: false },
        };
    }
}