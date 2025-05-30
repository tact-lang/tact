struct EmbeddedOptional {
    inner: Int?;
}

contract MultipleEmbeddedOptional {
    val1: EmbeddedOptional;
    val2: EmbeddedOptional;

    init() {
        self.val1 = EmbeddedOptional{ inner: null };
        self.val2 = EmbeddedOptional{ inner: null };
    }
}