struct DeepNested1 {
    x: Int;
}

struct DeepNested2 {
    y: DeepNested1;
}

struct DeepNested3 {
    z: DeepNested2;
}

contract TestContract {
    field: DeepNested3;

    init() {
        self.field = DeepNested3{z: DeepNested2{y: DeepNested1{x: 123}}};
    }
}