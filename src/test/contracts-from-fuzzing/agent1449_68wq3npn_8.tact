struct DeepNested5 {
    level: Int;
}

struct DeepNested4 {
    prev: DeepNested5;
}

struct DeepNested3 {
    prev: DeepNested4;
}

struct DeepNested2 {
    prev: DeepNested3;
}

struct DeepNested1 {
    prev: DeepNested2;
}

contract VeryDeepNesting {
    root: DeepNested1 = DeepNested1{
        prev: DeepNested2{
            prev: DeepNested3{
                prev: DeepNested4{
                    prev: DeepNested5{ level: 1 }
                }
            }
        }
    };

    init() {
        self.root = DeepNested1{
            prev: DeepNested2{
                prev: DeepNested3{
                    prev: DeepNested4{
                        prev: DeepNested5{ level: 42 }
                    }
                }
            }
        };
    }
}
