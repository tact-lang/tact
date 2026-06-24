struct Layer1 {
    f1: Int;
    f2: Layer2;
}

struct Layer2 {
    f3: Int;
    f4: Layer3;
}

struct Layer3 {
    f5: Int;
}

contract DeepLayerContract {
    layer: Layer1;

    init() {
        self.layer = Layer1{
            f1: 1,
            f2: Layer2{
                f3: 3,
                f4: Layer3{f5:5},
            },
        };
    }
}