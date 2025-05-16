struct DeepNested1 { f: Int; }
struct DeepNested2 { d: DeepNested1; }
struct DeepNested3 { d: DeepNested2; }
struct DeepNested4 { d: DeepNested3; }
struct DeepNested5 { d: DeepNested4; }

contract DeepNestTest {
    deepField: DeepNested5;

    init() {
        self.deepField = DeepNested5{
            d: DeepNested4{
                d: DeepNested3{
                    d: DeepNested2{
                        d: DeepNested1{
                            f: 777
                        }
                    }
                }
            }
        };
    }
}