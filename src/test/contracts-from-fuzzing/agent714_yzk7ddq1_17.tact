struct Rec1 {
    a: Int;
    b: Bool?;
}

struct Rec2 {
    x: Int;
    y: Rec1;
}

contract EmbedStructWithOpts {
    s: Rec2;

    init() {
        self.s = Rec2{
            x: 5,
            y: Rec1{ a: 11, b: null }
        };
    }
}