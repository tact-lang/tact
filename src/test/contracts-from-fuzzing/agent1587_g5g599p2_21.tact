struct Deeper1 { foo: Int; }
struct Deeper2 { deeper: Deeper1; }
struct Deeper3 { deeper: Deeper2; }
struct Deeper4 { deeper: Deeper3; }
struct Deeper5 { deeper: Deeper4; }

contract VeryDeepChain {
    data: Deeper5;

    init() {
        self.data = Deeper5{
            deeper: Deeper4{
                deeper: Deeper3{
                    deeper: Deeper2{
                        deeper: Deeper1{
                            foo: 77
                        }
                    }
                }
            }
        };
    }
}