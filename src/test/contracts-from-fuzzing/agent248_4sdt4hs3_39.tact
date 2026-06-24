contract JustStructs {
    f: Foo;

    init() {
        self.f = Foo{ a: 1, b: true, c: "x" };
    }
}

struct Foo {
    a: Int;
    b: Bool;
    c: String;
}