// optional struct inside optional struct field
struct LayerA {
    foo: Int = 1;
}

struct LayerB {
    nested: LayerA?;
}

contract OptNestedStruct {
    payload: LayerB;

    init() {
        self.payload = LayerB{
            nested: null,
        };
    }
}
