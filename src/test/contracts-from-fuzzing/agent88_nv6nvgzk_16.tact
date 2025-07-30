struct Nested {
    a: Int?;
    b: Bool;
}

contract TestContract {
    s: Nested?;

    init() {
        self.s = Nested {
            a: null,
            b: true
        };
    }
}