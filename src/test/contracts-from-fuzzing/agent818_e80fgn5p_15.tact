struct DeepMix {
    a: Layer1;
    b: String?;
}
struct Layer1 {
    x: Layer2;
}
struct Layer2 {
    y: Layer3?;
}
struct Layer3 {
    z: Int;
}

contract MixedDepthContract {
    data: DeepMix;

    init() {
        self.data = DeepMix{
            a: Layer1{
                x: Layer2{
                    y: Layer3{
                        z: 123
                    }
                }
            },
            b: null
        };
    }
}