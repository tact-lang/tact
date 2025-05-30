struct Layer4 {
    z: Int;
}
struct Layer3 {
    l4: Layer4;
}
struct Layer2 {
    l3: Layer3;
}
struct Layer1 {
    l2: Layer2;
}

contract FourDeep {
    store: Layer1;
    init() {
        self.store = Layer1{l2: Layer2{l3: Layer3{l4: Layer4{z: 999}}}};
    }
}