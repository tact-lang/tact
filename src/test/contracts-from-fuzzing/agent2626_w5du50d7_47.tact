struct DeepOptLayer1 {
    f1: Int?;
    f2: Bool?;
}
struct DeepOptLayer2 {
    g1: DeepOptLayer1;
    g2: DeepOptLayer1;
}
struct DeepOptLayer3 {
    h1: DeepOptLayer2;
    h2: DeepOptLayer2;
}

contract MultiLayerNestedOpt {
    val: DeepOptLayer3;

    init() {
        self.val = DeepOptLayer3{
            h1: DeepOptLayer2{
                g1: DeepOptLayer1{f1:null,f2:null},
                g2: DeepOptLayer1{f1:null,f2:null}
            },
            h2: DeepOptLayer2{
                g1: DeepOptLayer1{f1:null,f2:null},
                g2: DeepOptLayer1{f1:null,f2:null}
            }
        };
    }
}