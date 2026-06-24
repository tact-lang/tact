trait TraitA {
    a: Int;
}

trait TraitB with TraitA {
    a: Int;
    b: Int;
}

contract MultiTraitOverride with TraitB {
    a: Int;
    b: Int;

    init() {
        self.a = 1;
        self.b = 2;
    }
}