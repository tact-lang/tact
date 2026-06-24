struct Layer3 {
    v3: Int;
}
struct Layer2 {
    v2: Layer3;
}
struct Layer1 {
    v1: Layer2;
}

contract ChainNested {
    data: Layer1;
    init() {
        self.data = Layer1{ v1: Layer2{ v2: Layer3{ v3: 123 } } };
    }
}