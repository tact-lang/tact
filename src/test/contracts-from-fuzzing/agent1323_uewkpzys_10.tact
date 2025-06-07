struct Layer3 {
    val3: Int;
}

struct Layer2 {
    val2: Int;
    l3: Layer3;
}

struct Layer1 {
    val1: Int;
    l2: Layer2;
}

contract MultiLayerNested {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            val1:1,
            l2: Layer2{
                val2:2,
                l3: Layer3{val3:3}
            }
        };
    }
}
