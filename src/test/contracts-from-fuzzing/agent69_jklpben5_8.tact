struct Layer3 {
    num: Int;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract DeepField {
    deep: Layer1;

    init() {
        self.deep = Layer1{l2: Layer2{l3: Layer3{num: 999}}};
    }
}