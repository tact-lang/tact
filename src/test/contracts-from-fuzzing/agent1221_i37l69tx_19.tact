struct Layer3 {
    val: Int = 3;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract LayerCake {
    store: Layer1;

    init() {
        self.store = Layer1{
            l2: Layer2{
                l3: Layer3{}
            }
        };
    }
}