struct EmptyOptional {
    s: String?;
}

struct NonEmpty {
    n: Int;
    e: EmptyOptional;
}

contract EmbedOptionalField {
    f: NonEmpty;

    init() {
        self.f = NonEmpty{
            n: 123,
            e: EmptyOptional{ s: null }
        };
    }
}