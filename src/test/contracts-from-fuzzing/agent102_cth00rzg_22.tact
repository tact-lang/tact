struct Layer3 {
    leaf: Int;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract ThreeLayersNested {
    root: Layer1;

    init() {
        self.root = Layer1{
            l2: Layer2{
                l3: Layer3{ leaf: 123 }
            }
        };
    }
}