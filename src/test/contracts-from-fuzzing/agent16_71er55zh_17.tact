struct ALayer {
    intVal: Int;
    optStr: String?;
}

struct BLayer {
    layerA: ALayer;
    optBool: Bool?;
}

contract MultiNestedOptional {
    nested: BLayer;

    init() {
        self.nested = BLayer{
            layerA: ALayer{ intVal: 5, optStr: null },
            optBool: null
        };
    }
}