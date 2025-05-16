struct A {
    x: Int?;
    y: Bool;
}

contract OptionalField {
    s: A;

    init() {
        self.s = A{
            x: null,
            y: true
        };
    }
}