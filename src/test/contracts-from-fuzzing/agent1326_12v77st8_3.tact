struct DeepNest3 {
    d: Int;
}

struct DeepNest2 {
    c: DeepNest3;
}

struct DeepNest1 {
    b: DeepNest2;
}

contract DeepNestedField {
    field: DeepNest1;
    init() {
        self.field = DeepNest1{
            b: DeepNest2{
                c: DeepNest3{
                    d: 42,
                },
            },
        };
    }
}