struct DeeplyNested1 { a: Int }
struct DeeplyNested2 { d1: DeeplyNested1 }
struct DeeplyNested3 { d2: DeeplyNested2 }
struct DeeplyNested4 { d3: DeeplyNested3 }
struct DeeplyNested5 { d4: DeeplyNested4 }
struct DeeplyNested6 { d5: DeeplyNested5 }

contract NestedDepthTest {
    s: DeeplyNested6;

    init() {
        self.s = DeeplyNested6{
            d5: DeeplyNested5{
                d4: DeeplyNested4{
                    d3: DeeplyNested3{
                        d2: DeeplyNested2{
                            d1: DeeplyNested1{ a: 5 }
                        }
                    }
                }
            }
        };
    }
}