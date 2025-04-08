struct Layer1 {
    sub1: Layer2;
    sub2: Layer2;
}

struct Layer2 {
    value1: Int;
    value2: Bool;
}

contract DoubleNested {
    layer: Layer1;

    init() {
        self.layer = Layer1{
            sub1: Layer2{ value1:1, value2:true },
            sub2: Layer2{ value1:2, value2:false }
        };
    }
}