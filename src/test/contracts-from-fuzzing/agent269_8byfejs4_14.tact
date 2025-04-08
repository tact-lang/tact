struct Leaf {
    value: Int;
}

struct Layer1 {
    child: Leaf;
}

struct Layer2 {
    child: Layer1;
}

struct Layer3 {
    child: Layer2;
}

contract MultiLayerDeep {
    root: Layer3;

    init() {
        self.root = Layer3{
            child: Layer2{
                child: Layer1{
                    child: Leaf{ value: 123 }
                }
            }
        };
    }
}