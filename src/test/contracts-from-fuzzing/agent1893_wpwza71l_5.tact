struct DeepNested3 {
    f0: Int;
}

struct DeepNested2 {
    inner3: DeepNested3;
}

struct DeepNested1 {
    inner2: DeepNested2;
}

contract VeryDeep {
    val: DeepNested1;

    init() {
        self.val = DeepNested1{ inner2: DeepNested2{ inner3: DeepNested3{ f0: 11 } } };
    }
}