struct Layer3 {
    val: Int;
}

struct Layer2 {
    nested: Layer3;
}

struct Layer1 {
    nested: Layer2;
}

contract UltraDeep {
    value: Layer1;
    init() {
        self.value = Layer1{
            nested: Layer2{
                nested: Layer3{
                    val: 999,
                },
            },
        };
    }
}