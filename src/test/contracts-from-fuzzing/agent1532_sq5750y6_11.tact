struct InnerA { a: Int; b: Int; }
struct InnerB { c: Bool; d: String; e: Int?; }
struct Complex {
    i1: InnerA;
    i2: InnerB;
    text: String;
    opt: Bool?;
}

contract MultiNested {
    data: Complex;

    init() {
        self.data = Complex{
            i1: InnerA{ a: 5, b: 10 },
            i2: InnerB{ c: true, d: "hi", e: null },
            text: "hello",
            opt: false,
        };
    }
}