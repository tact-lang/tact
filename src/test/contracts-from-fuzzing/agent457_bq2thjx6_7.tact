struct DeepNested1 { f: Int }
struct DeepNested2 { d1: DeepNested1 }
struct DeepNested3 { d2: DeepNested2 }
struct DeepNested4 { d3: DeepNested3 }
struct DeepNested5 { d4: DeepNested4 }

contract Test {
    deep: DeepNested5;
    init() {
        self.deep = DeepNested5{
            d4: DeepNested4{
                d3: DeepNested3{
                    d2: DeepNested2{
                        d1: DeepNested1{ f: 99 }
                    }
                }
            }
        };
    }
}