struct OptionalEmbedded {
    inner: Inner?;
}

struct Inner {
    s: String;
}

contract OptionalEmbed {
    data: OptionalEmbedded;

    init() {
        self.data = OptionalEmbedded{ inner: null };
    }
}