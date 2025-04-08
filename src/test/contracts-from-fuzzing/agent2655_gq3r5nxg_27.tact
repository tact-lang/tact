struct SubType {
    foo: Int?;
}

struct TopType {
    embedded: SubType;
}

contract NullableEmbed {
    storage: TopType?;

    init() {
        self.storage = null;
    }
}