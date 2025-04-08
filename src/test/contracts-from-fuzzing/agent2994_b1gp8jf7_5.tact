struct NestedOptional {
    inner: InnerLayer?;
}

struct InnerLayer {
    num: Int;
    text: String;
    flag: Bool;
}

contract NestedOptionalField {
    myField: NestedOptional;

    init() {
        self.myField = NestedOptional{
            inner: InnerLayer{
                num: 42,
                text: "test",
                flag: true,
            },
        };
    }
}