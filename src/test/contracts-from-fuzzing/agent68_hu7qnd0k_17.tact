struct Inside {
    foo: Int;
    bar: Bool;
}

struct Outside {
    one: Int?;
    two: Bool;
    three: Inside?;
}

contract OptSubstruct {
    store: Outside;

    init() {
        self.store = Outside{
            one: null,
            two: false,
            three: null
        };
    }
}
