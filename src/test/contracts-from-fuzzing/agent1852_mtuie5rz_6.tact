struct NestedOptional {
    val: Int?;
    flag: Bool?;
}

struct OuterStruct {
    nested: NestedOptional?;
    text: String;
}

contract OptionalNested {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: null,
            text: "hello"
        };
    }
}