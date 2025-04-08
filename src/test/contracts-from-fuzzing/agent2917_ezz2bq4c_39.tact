struct OneOptional {
    maybe: String?;
}

struct Holder {
    inner: OneOptional;
    other: Int;
}

contract NestSingleOptional {
    stored: Holder;

    init() {
        self.stored = Holder{inner: OneOptional{maybe: null}, other: 99};
    }
}
