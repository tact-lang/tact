struct OptionalNested {
    n: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract OptionalNestedContract {
    st: OptionalNested;
    init() {
        self.st = OptionalNested{
            n: InnerStruct{
                flag: false,
                text: "hi",
            },
        };
    }
}