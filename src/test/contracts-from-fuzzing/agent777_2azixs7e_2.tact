struct Nested {
    x: Int;
    y: Bool;
}

struct Holder {
    value: Int?;
    sub: Nested?;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder{
            value: null,
            sub: null
        };
    }
}