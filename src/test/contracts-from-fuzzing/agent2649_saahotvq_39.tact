struct MultipleLayersDeep {
    in1: Layer1;
}

struct Layer1 {
    in2: Layer2;
}

struct Layer2 {
    in3: Layer3;
}

struct Layer3 {
    in4: Layer4;
}

struct Layer4 {
    val: Int;
}

contract ManyLayers {
    val: MultipleLayersDeep;

    init() {
        self.val = MultipleLayersDeep{
            in1: Layer1{
                in2: Layer2{
                    in3: Layer3{
                        in4: Layer4{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}