struct InnerMost {
    val: Int?;
}

struct Middle {
    nested: InnerMost;
    flag: Bool;
}

struct OuterStruct {
    mid: Middle;
    name: String;
}

contract ComplexNested {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{
            mid: Middle{
                nested: InnerMost{
                    val: null
                },
                flag: true
            },
            name: "nested"
        };
    }
}