struct Layer3 {
    n: Int;
}
struct Layer2 {
    l3: Layer3;
}
struct Layer1 {
    l2: Layer2;
}

contract NestedInit {
    layer: Layer1;

    init() {
        self.layer = Layer1{l2: Layer2{l3: Layer3{n: 999}}};
    }
}