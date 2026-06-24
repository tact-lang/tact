struct DeeplyNested3 {
    f: Int;
}

struct DeeplyNested2 {
    e: DeeplyNested3;
}

struct DeeplyNested1 {
    d: DeeplyNested2;
}

contract DeepNestTest {
    nest: DeeplyNested1;

    init() {
        self.nest = DeeplyNested1{
            d: DeeplyNested2{
                e: DeeplyNested3{
                    f: 123
                }
            }
        };
    }
}