struct DeepNest3 {
    z: String;
}

struct DeepNest2 {
    y: DeepNest3;
}

struct DeepNest1 {
    x: DeepNest2;
}

contract DeepNestedFields {
    field: DeepNest1;

    init() {
        self.field = DeepNest1{
            x: DeepNest2{
                y: DeepNest3{z: "deep"}
            }
        };
    }
}