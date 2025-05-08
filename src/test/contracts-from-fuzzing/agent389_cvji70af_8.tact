struct StringEmbedded {
    s: String;
    opt: String?;
}

contract StringFields {
    embedded: StringEmbedded;

    init() {
        self.embedded = StringEmbedded{
            s: "hello",
            opt: null
        };
    }
}