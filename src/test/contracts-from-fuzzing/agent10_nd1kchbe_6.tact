struct OptionalNested {
    val1: Int?;
    val2: Int?;
}

struct OuterStruct {
    nested: OptionalNested;
    flag: Bool;
}

contract NestedOptionals {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: OptionalNested{ val1: null, val2: 5 },
            flag: true
        };
    }
}