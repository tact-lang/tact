struct S {
    a: Int;
    b: Bool;
}

contract Test {
    repeat1: S;
    repeat2: S;
    repeat3: S;

    init() {
        self.repeat1 = S{ a: 1, b: true };
        self.repeat2 = S{ a: 2, b: false };
        self.repeat3 = S{ a: 3, b: true };
    }
}