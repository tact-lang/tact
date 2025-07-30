struct MultiLayerDeep1 { val: Int; }
struct MultiLayerDeep2 { nested: MultiLayerDeep1; }
struct MultiLayerDeep3 { nested: MultiLayerDeep2; }
struct MultiLayerDeep4 { nested: MultiLayerDeep3; }
struct MultiLayerDeep5 { nested: MultiLayerDeep4; }

contract TestContract {
    d: MultiLayerDeep5;

    init() {
        self.d = MultiLayerDeep5{
            nested: MultiLayerDeep4{
                nested: MultiLayerDeep3{
                    nested: MultiLayerDeep2{
                        nested: MultiLayerDeep1{
                            val: 99
                        }
                    }
                }
            }
        };
    }

    receive() {}
}