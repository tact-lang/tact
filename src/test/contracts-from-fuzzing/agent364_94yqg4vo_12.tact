struct L3 {
    deep: Int;
}

struct L2 {
    nest: L3;
}

struct L1 {
    layer: L2;
}

contract DeepNestTest {
    nested: L1;

    init() {
        self.nested = L1{
            layer: L2{
                nest: L3{
                    deep: 999
                }
            }
        };
    }
}