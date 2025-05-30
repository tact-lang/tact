struct NestedLevels3 {
    lv1: NestedLevels2;
}

struct NestedLevels2 {
    lv0: NestedLevels1;
}

struct NestedLevels1 {
    x: Int;
    y: Bool;
}

contract StorageTest {
    data: NestedLevels3;

    init() {
        self.data = NestedLevels3{
            lv1: NestedLevels2{
                lv0: NestedLevels1{
                    x: 42,
                    y: false
                }
            }
        };
    }
}
