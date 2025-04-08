struct DeepA { a: Int; }
struct DeepB { b: DeepA; }
struct DeepC { c: DeepB; }
struct DeepD { d: DeepC; }
struct DeepE { e: DeepD; }

contract TestContract {
    s: DeepE;

    init() {
        self.s = DeepE{
            e: DeepD{
                d: DeepC{
                    c: DeepB{
                        b: DeepA{
                            a: 123
                        }
                    }
                }
            }
        };
    }
}