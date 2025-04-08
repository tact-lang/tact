struct NestedStrings {
    greeting: String;
    nested: String;
}

struct HasNested {
    partA: NestedStrings;
    partB: NestedStrings;
}

contract TestContract {
    combined: HasNested;

    init() {
        self.combined = HasNested{
            partA: NestedStrings{
                greeting: "hi",
                nested: "innerA"
            },
            partB: NestedStrings{
                greeting: "hello",
                nested: "innerB"
            }
        };
    }
}