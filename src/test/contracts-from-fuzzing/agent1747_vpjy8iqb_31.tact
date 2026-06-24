struct BoolLayer {
    inner: BoolOptional?;
}

struct BoolOptional {
    flag: Bool?;
}

contract NestedBools {
    layer: BoolLayer;

    init() {
        self.layer = BoolLayer{ inner: BoolOptional{ flag: null } };
    }
}