struct Inner2 {
    a: Int;
}

struct InnerOpt2 {
    x: Inner2?;
}

contract MultiLayerOptional {
    f: InnerOpt2?;
    init() {
        self.f = null;
    }
}