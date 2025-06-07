struct Nested {
    s: String;
    c: Cell;
}

struct OuterOption {
    inner: Nested?;
    flag: Bool;
}

contract OptionWithNestedStruct {
    content: OuterOption;

    init() {
        self.content = OuterOption{
            inner: null,
            flag: true,
        };
    }
}