struct Embed1 {
    x: Int; y: Bool;
}
struct Embed2 {
    a: String; b: Int?;
}

struct Combined {
    e1: Embed1;
    e2: Embed2;
}

contract DoubleEmbed {
    c: Combined;
    init() {
        self.c = Combined{
            e1: Embed1{ x: 10, y: true },
            e2: Embed2{ a: "hey", b: null },
        };
    }
}