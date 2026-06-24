struct MixedOptionalNested {
    inner1: InnerStruct?;
    inner2: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    optVal: Int?;
}

contract MixedNestedOptionalContract {
    value: MixedOptionalNested;

    init() {
        self.value = MixedOptionalNested{
            inner1: InnerStruct{
                flag: true,
                optVal: null
            },
            inner2: InnerStruct{
                flag: false,
                optVal: 123
            }
        };
    }
}