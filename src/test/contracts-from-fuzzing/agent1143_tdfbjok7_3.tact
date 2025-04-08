struct DeepNested1 { x: Int; }
struct DeepNested2 { n: DeepNested1; }
struct DeepNested3 { n: DeepNested2; }
struct DeepNested4 { n: DeepNested3; }
struct DeepNested5 { n: DeepNested4; }

contract DeepContract {
    data: DeepNested5;

    init() {
        self.data = DeepNested5{
            n: DeepNested4{
                n: DeepNested3{
                    n: DeepNested2{
                        n: DeepNested1{
                            x: 777
                        }
                    }
                }
            }
        };
    }
}