struct Layer3 {
    l3: String?;
}
struct Layer2 {
    l2: Layer3?;
}
struct Layer1 {
    l1: Layer2?;
}

contract OptionalNestedDeep {
    s: Layer1;
    init() {
        self.s = Layer1{l1: Layer2{l2: Layer3{l3: null}}};
    }
    receive() {}
}