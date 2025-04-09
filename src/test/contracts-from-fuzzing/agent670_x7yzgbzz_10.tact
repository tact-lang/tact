struct DeepNestedA {
    val: Int;
}

struct DeepNestedB {
    a: DeepNestedA;
}

struct DeepNestedC {
    b: DeepNestedB;
}

struct DeepNestedD {
    c: DeepNestedC;
}

contract SuperDeep {
    data: DeepNestedD;

    init() {
        self.data = DeepNestedD{
            c: DeepNestedC{
                b: DeepNestedB{
                    a: DeepNestedA{
                        val: -100
                    }
                }
            }
        };
    }
}