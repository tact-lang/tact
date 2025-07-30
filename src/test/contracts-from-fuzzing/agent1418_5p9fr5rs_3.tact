struct DeepNest3 {
    flag: Bool?;
}

struct DeepNest2 {
    value: DeepNest3;
}

struct DeepNest1 {
    point: DeepNest2;
}

contract DeepNestedStructs {
    nested: DeepNest1;

    init() {
        self.nested = DeepNest1{
            point: DeepNest2{
                value: DeepNest3{
                    flag: true,
                },
            },
        };
    }
}