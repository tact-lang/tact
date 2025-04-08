struct EmbedA { a:Int; }
struct EmbedB { b:Int; }

struct Top {
    a:EmbedA;
    b:EmbedB;
}

contract CrossEmbed {
    f:Top;

    init() {
        self.f = Top{a: EmbedA{a:1}, b:EmbedB{b:2}};
    }
}