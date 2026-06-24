struct LayerOne {
    optInt1: Int?;
    optInt2: Int?;
}

struct LayerTwo {
    nested: LayerOne;
    intVal: Int;
}

contract OptionalNestingTest {
    storage: LayerTwo;

    init() {
        self.storage = LayerTwo{
            nested: LayerOne{
                optInt1: null,
                optInt2: 100,
            },
            intVal: 50,
        };
    }
}