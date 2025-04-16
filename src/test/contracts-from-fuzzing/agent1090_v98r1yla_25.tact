struct DeepLayer3 {
    val: Int;
}

struct DeepLayer2 {
    nested: DeepLayer3;
}

struct DeepLayer1 {
    nested: DeepLayer2;
}

contract DeepOptionalStruct {
    s: DeepLayer1?;

    init() {
        self.s = null;
    }
}