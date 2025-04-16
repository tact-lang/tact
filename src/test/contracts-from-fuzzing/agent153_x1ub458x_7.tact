struct DeepNested3 {
    z: Int?;
}

struct DeepNested2 {
    y2: DeepNested3;
}

struct DeepNested1 {
    y1: DeepNested2;
}

contract DeepNestedContract {
    field: DeepNested1 = DeepNested1{y1: DeepNested2{y2: DeepNested3{z: null}}};
}