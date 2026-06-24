struct S {
    x: Int;
    y: String;
    flag: Bool;
}

contract Test {
    a: S;
    b: S;
    c: S;

    init() {
        self.a = S{ x: 1, y: "A", flag: true };
        self.b = S{ x: 2, y: "B", flag: false };
        self.c = S{ x: 3, y: "C", flag: true };
    }
}