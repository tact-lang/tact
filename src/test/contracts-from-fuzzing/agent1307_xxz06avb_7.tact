struct BigNested {
    s1: String;
    s2: String;
    flag: Bool;
    optFlag: Bool?;
    number: Int;
    optNumber: Int?;
    deep: InnerDeep;
}

struct InnerDeep {
    inside: Deepest;
    flag2: Bool;
}

struct Deepest {
    name: String;
    value: Int;
    optVal: Int?;
}

contract DeepStore {
    d: BigNested = BigNested{
        s1: "a", s2: "b", flag: true, optFlag: null, number: 5, optNumber:null,
        deep: InnerDeep{ inside: Deepest{ name: "n", value: 1, optVal: null }, flag2: false }
    };

    init() {
        self.d = BigNested{
            s1: "aa", s2: "bb", flag: false, optFlag: true, number: 100, optNumber:777,
            deep: InnerDeep{
                inside: Deepest{ name: "name", value: 42, optVal: 999 },
                flag2: true
            }
        };
    }
}