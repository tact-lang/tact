struct Inner {
    f: Bool = false;
}

struct Mid {
    inn: Inner;
}

struct OuterOpt {
    middle: Mid?;
}

contract OptionalNestedStructField {
    x: OuterOpt;

    init() {
        self.x = OuterOpt{ middle: null };
    }

    receive() {}
}