struct EmbeddedString {
    a: String = "a";
    b: String = "b";
    c: String = "c";
    d: String = "d";
}

struct HasEmbedded {
    e: EmbeddedString;
}

contract NestedStringStructs {
    data: HasEmbedded;

    init() {
        self.data = HasEmbedded{ e: EmbeddedString{} };
    }
}