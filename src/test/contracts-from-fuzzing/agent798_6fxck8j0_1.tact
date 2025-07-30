struct DeepNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
}

struct Nested3 {
    leaf1: Int?;
    leaf2: Bool?;
    leaf3: Address?;
}

contract TestStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: Nested1{
                level2: Nested2{
                    level3: Nested3{
                        leaf1: 123,
                        leaf2: true,
                        leaf3: null,
                    }
                }
            }
        };
    }
}