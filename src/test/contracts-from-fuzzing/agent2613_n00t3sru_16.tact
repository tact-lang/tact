struct Inner {
    x: Int;
    y: String;
}

struct Mid {
    innerOpt: Inner?;
    another: Bool;
}

contract OptNestedField {
    state: Mid;

    init() {
        self.state = Mid{
            innerOpt: null,
            another: true
        };
    }
}