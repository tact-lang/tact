struct DeepNest1 {
    v1: Int;
}
struct DeepNest2 {
    v2: DeepNest1;
}
struct DeepNest3 {
    v3: DeepNest2;
}

contract DeeplyNested {
    nested: DeepNest3;
    init() {
        self.nested = DeepNest3{v3: DeepNest2{v2: DeepNest1{v1:42}}};
    }
}
