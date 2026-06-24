struct OptEmbedded {
    optInner: Int?;
}

contract NullableField {
    embedded: OptEmbedded?;

    init() {
        self.embedded = null;
    }
}