struct NestedEmbedding {
    a: EmbedA;
    b: EmbedB;
    c: EmbedC;
}

struct EmbedA {
    x: Int;
}

struct EmbedB {
    y: Bool;
}

struct EmbedC {
    z: String;
}

contract WithEmbeddings {
    ne: NestedEmbedding;

    init() {
        self.ne = NestedEmbedding{
            a: EmbedA{ x: 1 },
            b: EmbedB{ y: true },
            c: EmbedC{ z: "abc" }
        };
    }
}