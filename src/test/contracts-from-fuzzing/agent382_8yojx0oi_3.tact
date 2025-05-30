struct NestedStructLevel2 {
    y: Int;
}

struct NestedStructLevel1 {
    x: NestedStructLevel2;
}

contract DeepNestingTest {
    nested: NestedStructLevel1;

    init() {
        self.nested = NestedStructLevel1{
            x: NestedStructLevel2{
                y: 123
            }
        };
    }
}