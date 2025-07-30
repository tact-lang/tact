struct MultiLayerOpt1 {
    x: MultiLayerOpt2?;
}

struct MultiLayerOpt2 {
    y: MultiLayerOpt3?;
}

struct MultiLayerOpt3 {
    z: MultiLayerOpt4?;
}

struct MultiLayerOpt4 {
    val: Int?;
}

contract MLTest {
    data: MultiLayerOpt1;

    init() {
        self.data = MultiLayerOpt1{
            x: MultiLayerOpt2{
                y: MultiLayerOpt3{
                    z: MultiLayerOpt4{val:null}
                }
            }
        };
    }
}
