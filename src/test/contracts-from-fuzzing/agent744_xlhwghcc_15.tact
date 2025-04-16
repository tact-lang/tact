struct Layers {
    l1: Layer1;
}

struct Layer1 {
    l2: Layer2;
    l2opt: Layer2?;
}

struct Layer2 {
    l3: Layer3;
    flag: Bool?;
}

struct Layer3 {
    num: Int;
}

contract TestContract {
    layers: Layers;

    init() {
        self.layers = Layers{
            l1: Layer1{
                l2: Layer2{ l3: Layer3{ num: 77 }, flag: null },
                l2opt: null
            }
        };
    }
}