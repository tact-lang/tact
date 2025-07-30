struct Layer1 {
    val1: Int;
    next: Layer2;
}

struct Layer2 {
    val2: Int?;
    next: Layer3;
}

struct Layer3 {
    val3: Bool;
}

contract MultiLayerNested {
    nested: Layer1;
    init() {
        self.nested = Layer1{
            val1: 10,
            next: Layer2{
                val2: null,
                next: Layer3{
                    val3: true
                }
            }
        };
    }
}