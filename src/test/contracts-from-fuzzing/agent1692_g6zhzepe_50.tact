trait DeepTrait {
    x: Int;
}

struct TraitInsideStruct {
    a: Int;
    b: Int;
}

contract TraitStructMix with DeepTrait {
    x: Int;
    nested: TraitInsideStruct = TraitInsideStruct{a:1,b:2};

    init() {
        self.x = 42;
    }
}