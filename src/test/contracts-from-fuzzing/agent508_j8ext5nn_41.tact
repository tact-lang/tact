// composing contract fields using nested structs and mix of optionals and serialization

struct InnerMost {
    a: Int as uint8;
    b: Bool;
    c: String?;
}

struct Mid {
    x: InnerMost;
    y: InnerMost?;
}

struct Top {
    m1: Mid;
    m2: Mid?;
}

contract Complex {
    state: Top;
    init() {
        self.state = Top{
            m1: Mid{
                x: InnerMost{ a:4, b:true, c:null },
                y: null
            },
            m2: null
        };
    }
}
