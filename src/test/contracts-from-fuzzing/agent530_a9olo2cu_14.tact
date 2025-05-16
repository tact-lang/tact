struct DeepA { v: Int; }
struct DeepB { v: DeepA; }
struct DeepC { v: DeepB; }
struct DeepD { v: DeepC; }
struct DeepE { v: DeepD; }

contract DeepFive {
    d: DeepE;

    init() {
        self.d = DeepE{
            v: DeepD{
                v: DeepC{
                    v: DeepB{
                        v: DeepA{
                            v: 999
                        }
                    }
                }
            }
        };
    }
}
