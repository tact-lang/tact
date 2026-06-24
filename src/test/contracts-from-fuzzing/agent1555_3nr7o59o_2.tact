struct InnerNested {
    a: Int;
    b: String;
}

struct OuterContainer {
    nested: InnerNested;
    flag: Bool;
    note: String?;
}

contract NestedStructContract {
    data: OuterContainer;

    init() {
        self.data = OuterContainer{
            nested: InnerNested{ a: 5, b: "hi" },
            flag: true,
            note: null,
        };
    }

    receive() {
        // no-op
    }
}