struct BoolLayer {
    flag: Bool;
    nested: Bool?;
}

contract BoolVariations {
    data: BoolLayer;

    init() {
        self.data = BoolLayer{ flag: true, nested: null };
    }
}
