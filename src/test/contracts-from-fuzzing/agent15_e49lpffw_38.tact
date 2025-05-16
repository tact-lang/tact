// Try nested nulls in struct fields combined with explicit integer serializations
struct Layer {
    x: Int? as uint8;
    y: Bool?;
}

contract SerializeNested {
    l1: Layer;
    l2: Layer;

    init() {
        self.l1 = Layer{ x: null, y: null };
        self.l2 = Layer{ x: null, y: null };
    }
}