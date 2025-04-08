struct SLeaf {
    k: Int;
}

struct SMiddle {
    leaf: SLeaf?;
}

contract OptionalInOptional {
    persist: SMiddle?;

    init() {
        self.persist = SMiddle{
            leaf: SLeaf{ k: 101 }
        };
    }
}