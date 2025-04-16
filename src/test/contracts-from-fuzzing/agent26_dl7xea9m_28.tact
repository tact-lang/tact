struct DeepD {
    x: Int? = null;
}
struct DeepC {
    d: DeepD = DeepD{};
}
struct DeepB {
    c: DeepC = DeepC{};
}
struct DeepA {
    b: DeepB = DeepB{};
}

contract ChainDef {
    s: DeepA = DeepA{};
    init() {
        self.s = DeepA{};
    }
}