struct DeeplyNested {
    a: Int;
}

struct Wrap1 {
    x: DeeplyNested?;
}

struct Wrap2 {
    y: Wrap1?;
}

struct Wrap3 {
    z: Wrap2?;
}

contract NullEnds {
    chain: Wrap3;
    init() {
        self.chain = Wrap3{ z: null };
    }
}