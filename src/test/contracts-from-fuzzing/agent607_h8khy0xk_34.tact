struct Outermost {
    middle: Middle?;
}

struct Middle {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract DeeplyNestedOptionals {
    data: Outermost;

    init() {
        self.data = Outermost{ middle: Middle{ inner: Inner{ value: 42 } } };
    }
}