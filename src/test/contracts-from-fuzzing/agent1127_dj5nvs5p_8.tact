struct LargeNested {
    a: Int; b: Bool; c: String;
    d: Inner1; e: Inner2;
}

struct Inner1 {
    x: Int; y: String;
}

struct Inner2 {
    f: Bool; g: String?;
}

contract BigNest {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: 5, b: true, c: "test",
            d: Inner1{ x: 10, y: "hello" },
            e: Inner2{ f: false, g: null },
        };
    }
}
