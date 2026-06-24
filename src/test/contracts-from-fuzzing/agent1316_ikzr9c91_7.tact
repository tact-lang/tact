struct VeryDeep1 { level2: VeryDeep2; }
struct VeryDeep2 { level3: VeryDeep3; }
struct VeryDeep3 { level4: VeryDeep4; }
struct VeryDeep4 { leaf: Int; }

contract DeepNestingTest {
    x: VeryDeep1;

    init() {
        self.x = VeryDeep1{
            level2: VeryDeep2{
                level3: VeryDeep3{
                    level4: VeryDeep4{
                        leaf: 123
                    }
                }
            }
        };
    }
}