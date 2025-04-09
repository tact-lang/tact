struct StructA {
  f1: Int;
}

struct StructB {
  f2: StructA;
}

struct StructC {
  f3: StructB;
}

struct StructD {
  f4: StructC;
}

contract DeepNest {
    val: StructD;

    init() {
        self.val = StructD{
            f4: StructC{
                f3: StructB{
                    f2: StructA{
                        f1: 42
                    }
                }
            }
        };
    }
}