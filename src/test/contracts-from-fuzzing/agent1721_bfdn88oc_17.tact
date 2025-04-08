struct DeepNested {
    lvl1: DeepNested2;
}

struct DeepNested2 {
    lvl2: DeepNested3;
}

struct DeepNested3 {
    lvl3: DeepNested4;
}

struct DeepNested4 {
    lvl4: DeepNested5;
}

struct DeepNested5 {
    val: Int;
}

contract FiveDeep {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            lvl1: DeepNested2{
                lvl2: DeepNested3{
                    lvl3: DeepNested4{
                        lvl4: DeepNested5{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}
