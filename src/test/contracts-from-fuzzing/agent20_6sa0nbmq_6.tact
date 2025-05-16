struct NestedOptional {
    innerBool: Bool?;
    innerInt: Int?;
    innerStr: String?;
}

struct OuterStruct {
    nested: NestedOptional;
    flag: Bool;
}

contract TestContract {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{
            nested: NestedOptional{
                innerBool: null,
                innerInt: 10,
                innerStr: "hi",
            },
            flag: true,
        };
    }
}
