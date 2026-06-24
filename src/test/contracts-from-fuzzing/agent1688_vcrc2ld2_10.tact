struct OptionalNestedStruct {
    nested: ContainsString?;
}

struct ContainsString {
    text: String;
}

contract TestContract {
    data: OptionalNestedStruct;
    init() {
        self.data = OptionalNestedStruct{
            nested: null
        };
    }
}