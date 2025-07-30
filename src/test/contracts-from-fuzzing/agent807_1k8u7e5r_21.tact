struct EmbeddedStrings {
    one: String;
    two: String;
    three: String;
}

struct WithEmbedded {
    inner: EmbeddedStrings;
    more: String;
}

contract NestedStrings {
    val: WithEmbedded;
    init() {
        self.val = WithEmbedded{
            inner: EmbeddedStrings{
                one:"a",
                two:"b",
                three:"c"
            },
            more: "d"
        };
    }
}