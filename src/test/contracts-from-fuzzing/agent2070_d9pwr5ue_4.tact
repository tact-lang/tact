struct DeepNested {
    l1: L2;
}

struct L2 {
    l2: L3;
}

struct L3 {
    l3: L4;
}

struct L4 {
    value: Int;
    flag: Bool;
}

contract DeepNestTest {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            l1: L2{
                l2: L3{
                    l3: L4{
                        value: 99,
                        flag: true,
                    }
                }
            }
        };
    }
}
