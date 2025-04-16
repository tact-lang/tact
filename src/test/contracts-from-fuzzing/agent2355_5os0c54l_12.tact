struct ComplexEmbed {
    inner1: Embed1;
    inner2: Embed2;
}

struct Embed1 {
    a: Int;
    b: Bool;
}

struct Embed2 {
    c: String;
    d: Slice;
}

contract HasEmbed {
    ce: ComplexEmbed;

    init() {
        self.ce = ComplexEmbed{
            inner1: Embed1{ a: 5, b: true },
            inner2: Embed2{ c: "embedded", d: emptyCell().asSlice() }
        };
    }
}