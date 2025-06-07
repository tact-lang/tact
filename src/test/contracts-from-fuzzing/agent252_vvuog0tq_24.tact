struct InnerMost {
    x: Int?
}

struct Layer2 {
    inner: InnerMost?
}

struct Layer1 {
    layer2: Layer2?
}

contract DeepNull {
    root: Layer1;

    init() {
        self.root = Layer1 { layer2: null };
    }
}