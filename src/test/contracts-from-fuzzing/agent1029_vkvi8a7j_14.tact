struct NestedManyLevels {
    level1: Layer1;
}

struct Layer1 {
    level2: Layer2;
}

struct Layer2 {
    level3: Layer3;
}

struct Layer3 {
    val1: Int;
    val2: Int?;
    val3: String;
    val4: Bool?;
}

contract TestDeep {
    data: NestedManyLevels;

    init() {
        self.data = NestedManyLevels{
            level1: Layer1{
                level2: Layer2{
                    level3: Layer3{
                        val1: 42,
                        val2: null,
                        val3: "abc",
                        val4: null
                    }
                }
            }
        };
    }
}
