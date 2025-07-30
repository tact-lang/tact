struct B {
    s: String;
    n: Int;
}

contract OptionalStructPopulated {
    b: B?;

    init() {
        self.b = B{ s:"hi", n: 5 };
    }
}