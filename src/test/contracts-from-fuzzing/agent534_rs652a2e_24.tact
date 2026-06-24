struct DeepLayer3 {
    val: Int;
}

struct DeepLayer2 {
    d3: DeepLayer3;
}

struct DeepLayer1 {
    d2: DeepLayer2;
}

contract DeepLevelsContract {
    root: DeepLayer1;

    init() {
        self.root = DeepLayer1{
            d2: DeepLayer2{
                d3: DeepLayer3{val: 314}
            }
        };
    }
}