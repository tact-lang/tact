struct Deep {
    foo: Int = 17;
    bar: Bool? = null;
}

struct Holder {
    nested: Deep;
    other: Int = 5;
}

contract TestContract {
    save: Holder;

    init() {
        self.save = Holder{
            nested: Deep{},
            other: 42
        };
    }
}