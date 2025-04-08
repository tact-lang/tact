struct A {
    q: Int;
    r: Bool?;
}

contract OptionalStructFieldContract {
    a: A;

    init() {
        self.a = A{ q: 42, r: null };
    }
}