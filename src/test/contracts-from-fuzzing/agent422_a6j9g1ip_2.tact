struct DeepNested {
    x: Int;
    y: Bool;
}

struct Wrapper {
    nested1: DeepNested;
    nested2: DeepNested;
}

contract ComplexStorage {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            nested1: DeepNested{x: 5, y: true},
            nested2: DeepNested{x: 10, y: false},
        };
    }
}