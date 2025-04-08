struct DeepLayer1 {
    inner: DeepLayer2;
}

struct DeepLayer2 {
    inner: DeepLayer3;
}

struct DeepLayer3 {
    val: Int;
    flag: Bool;
}

contract VeryDeepNested {
    d: DeepLayer1;

    init() {
        self.d = DeepLayer1{ inner: DeepLayer2{ inner: DeepLayer3{ val: 7, flag: true } } };
    }
}