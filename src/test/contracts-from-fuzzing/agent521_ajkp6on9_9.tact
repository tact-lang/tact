struct S {
    x: Int;
    y: String;
}

contract DualStructs {
    a: S;
    b: S;

    init() {
        self.a = S{x: 1, y: "A"};
        self.b = S{x: 2, y: "B"};
    }
}