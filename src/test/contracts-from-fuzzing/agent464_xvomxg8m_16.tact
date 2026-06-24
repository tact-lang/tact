struct DeepTuple {
    intVal: Int;
    boolVal: Bool;
    textVal: String;
}

struct Container {
    nested: DeepTuple;
    optionalNested: DeepTuple?;
}

contract CompoundContainer {
    store: Container;

    init() {
        self.store = Container{
            nested: DeepTuple{ intVal: 1, boolVal: true, textVal: "x" },
            optionalNested: null
        };
    }
}
