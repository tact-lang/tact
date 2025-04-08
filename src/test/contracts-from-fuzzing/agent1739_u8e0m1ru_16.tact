struct One {
    a: Int;
}

struct Two {
    b: Int;
}

struct Merge {
    fst: One;
    snd: Two;
}

contract StructEmbedding {
    merged: Merge;
    init() {
        self.merged = Merge{
            fst: One{ a: 11 },
            snd: Two{ b: 22 }
        };
    }
}