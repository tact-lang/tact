struct DeepA { x: Int; }
struct DeepB { a: DeepA; }
struct DeepC { b: DeepB; }
struct DeepD { c: DeepC; }
struct DeepE { d: DeepD; }

contract SuperDeep {
    v: DeepE;

    init() {
        self.v = DeepE{
            d: DeepD{
                c: DeepC{
                    b: DeepB{
                        a: DeepA{ x: 5 }
                    }
                }
            }
        };
    }
}