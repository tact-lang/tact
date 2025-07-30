struct DeepA {
  a: Int;
}

struct DeepB {
  b: DeepA;
}

struct DeepC {
  c: DeepB;
}

struct DeepD {
  d: DeepC;
}

struct DeepE {
  e: DeepD;
}

contract DeepFive {
    field: DeepE;

    init() {
        self.field = DeepE{
            e: DeepD{
                d: DeepC{
                    c: DeepB{
                        b: DeepA{
                            a: 999
                        }
                    }
                }
            }
        };
    }
}
