struct DeepLayer1 {
    x: Int?;
    y: Bool?;
}

struct DeepLayer2 {
    inner: DeepLayer1?;
    s: String;
}

struct DeepLayer3 {
    nested: DeepLayer2?;
}

contract ChainedOptionals {
    top: DeepLayer3?;

    init() {
        self.top = null;
    }
}