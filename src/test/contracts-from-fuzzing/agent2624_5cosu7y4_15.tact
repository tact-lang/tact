struct BigNested {
    four: Int;
    nest: NestedComposite;
}

struct NestedComposite {
    str: String;
    opt: Int?;
    deep: ReallyDeep;
}

struct ReallyDeep {
    flag: Bool;
    optionalFlag: Bool?;
}

contract DeepHybridStorage {
    data: BigNested;

    init() {
        self.data = BigNested{
            four: 1234,
            nest: NestedComposite{
                str: "abc",
                opt: null,
                deep: ReallyDeep{
                    flag: false,
                    optionalFlag: true
                }
            }
        };
    }
}
