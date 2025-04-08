struct DeepNesting1 {
    s: DeepNesting2;
}
struct DeepNesting2 {
    s: DeepNesting3;
}
struct DeepNesting3 {
    s: DeepNesting4;
}
struct DeepNesting4 {
    s: DeepNesting5;
}
struct DeepNesting5 {
    s: DeepNesting6;
}
struct DeepNesting6 {
    val: Int;
}

contract TestContract {
    data: DeepNesting1;

    init() {
        self.data = DeepNesting1{
            s: DeepNesting2{
                s: DeepNesting3{
                    s: DeepNesting4{
                        s: DeepNesting5{
                            s: DeepNesting6{
                                val: 99
                            }
                        }
                    }
                }
            }
        };
    }
}