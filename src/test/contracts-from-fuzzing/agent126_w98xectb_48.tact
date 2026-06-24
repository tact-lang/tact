struct DeepDef {
    val: Int;
}

contract DeepDefault {
    nested: DeepDef = DeepDef{ val:3 };

    init() {
        self.nested = DeepDef{ val:5 };
    }
}