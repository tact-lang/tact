struct MultiLayerOpt {
    a: L1?;
}
struct L1 {
    b: L2?;
}
struct L2 {
    c: L3?;
}
struct L3 {
    val: Int?;
}

contract DeepOptionals {
    f: MultiLayerOpt;
    init() {
        self.f = MultiLayerOpt{
            a: L1{
                b: L2{
                    c: L3{
                        val: null
                    }
                }
            }
        };
    }
}