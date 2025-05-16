struct DeeplyNested {
    inner: StructLevel2;
}

struct StructLevel2 {
    deeper: StructLevel3;
}

struct StructLevel3 {
    num: Int;
    enabled: Bool;
}

contract DeeplyNestedTest {
    param: DeeplyNested;

    init() {
        self.param = DeeplyNested{
            inner: StructLevel2{
                deeper: StructLevel3{
                    num: 77,
                    enabled: true
                }
            }
        };
    }
}
