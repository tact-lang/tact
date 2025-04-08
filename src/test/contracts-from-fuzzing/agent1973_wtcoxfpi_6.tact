struct Inner1 { x: Int; y: Bool; }
struct Inner2 { a: String; b: Int?; }
struct Top {
    f1: Inner1;
    f2: Inner2;
    f3: Bool;
}

contract MixedNested {
    data: Top;

    init() {
        self.data = Top{
            f1: Inner1{ x: 5, y: true },
            f2: Inner2{ a: "abc", b: null },
            f3: false,
        };
    }
}
