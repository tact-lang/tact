struct Leaf {
    a: Int as uint8;
    b: Bool;
}
struct Mid {
    x: Leaf;
    y: Int as uint16;
}
struct Top {
    m: Mid;
    s: String;
}

contract SerializationMix {
    data: Top;

    init() {
        self.data = Top{
            m: Mid{
                x: Leaf{
                    a: 5,
                    b: true
                },
                y: 65000
            },
            s: "edgecase"
        };
    }
}
