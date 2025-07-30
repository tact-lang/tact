struct Layer3 {
    leaf: Int?;
}

struct Layer2 {
    middle: Layer3;
}

struct Layer1 {
    top: Layer2;
}

contract MultiLayerOptional {
    data: Layer1;

    init() {
        self.data = Layer1{top: Layer2{middle: Layer3{leaf: 42}}};
    }
}