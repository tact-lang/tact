struct InnerStruct {
    num: Int;
    flag: Bool;
    text: String;
}

struct OuterStruct {
    someInner: InnerStruct;
    optInner: InnerStruct?;
    optNum: Int?;
}

contract CompositeNestedOptional {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            someInner: InnerStruct{ num: 1, flag: true, text: "a" },
            optInner: null,
            optNum: null
        };
    }
}