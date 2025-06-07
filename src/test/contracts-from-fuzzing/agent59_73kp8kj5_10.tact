struct Layer3 {
    z: Int;
}

struct Layer2 {
    y: Layer3;
}

struct Layer1 {
    x: Layer2;
}

contract MultiLayerNested {
    data: Layer1;

    init() {
        self.data = Layer1{
            x: Layer2{
                y: Layer3{ z: 100 }
            }
        };
    }
}
