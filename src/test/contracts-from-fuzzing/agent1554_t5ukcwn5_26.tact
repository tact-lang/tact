struct DeepStructA { intA: Int; }
struct DeepStructB { a: DeepStructA; }
struct DeepStructC { b: DeepStructB; }
struct DeepStructD { c: DeepStructC; }

contract DeepStructsFinal {
    s: DeepStructD;

    init() {
        self.s = DeepStructD{
            c: DeepStructC{
                b: DeepStructB{
                    a: DeepStructA{ intA: 77 }
                }
            }
        };
    }
}