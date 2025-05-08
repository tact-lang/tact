struct NestedString {
    text: String;
    again: String;
}

struct HasNested {
    main: String;
    nested: NestedString;
}

contract StringNest {
    store: HasNested;

    init() {
        self.store = HasNested{
            main: "head",
            nested: NestedString{
                text: "deep",
                again: "very deep"
            }
        };
    }
}