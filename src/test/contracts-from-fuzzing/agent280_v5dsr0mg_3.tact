struct DeepLevel3 {
    val: Int;
}

struct DeepLevel2 {
    d3: DeepLevel3;
}

struct DeepLevel1 {
    d2: DeepLevel2;
}

contract DeepNested {
    field: DeepLevel1;

    init() {
        self.field = DeepLevel1{
            d2: DeepLevel2{
                d3: DeepLevel3{val: 42},
            },
        };
    }
}