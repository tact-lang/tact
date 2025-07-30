struct Embed {
    value: Int as uint16;
}

struct Container {
    emb: Embed;
    other: String;
}

contract StructInsideWithSerialization {
    s: Container;

    init() {
        self.s = Container{ emb: Embed{ value: 42 }, other: "ok" };
    }
}