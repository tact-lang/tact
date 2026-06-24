struct DeeplyNested1 {
    val: Int;
}

struct DeeplyNested2 {
    nested: DeeplyNested1;
}

struct DeeplyNested3 {
    nested: DeeplyNested2;
}

struct DeeplyNested4 {
    nested: DeeplyNested3;
}

contract DeeplyNestedContract {
    data: DeeplyNested4;

    init() {
        self.data = DeeplyNested4{
            nested: DeeplyNested3{
                nested: DeeplyNested2{
                    nested: DeeplyNested1{
                        val: 7
                    }
                }
            }
        };
    }
}