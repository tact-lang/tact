struct Layer {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    nested: LayerNested?;
}

struct LayerNested {
    num: Int?;
    flag: Bool = true;
}

contract TestContract {
    s: Layer;
    init() {
        self.s = Layer{
            intVal: 100,
            boolVal: false,
            stringVal: "bla",
            nested: LayerNested{
                num: null,
            }
        };
    }
}