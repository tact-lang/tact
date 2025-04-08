struct Layer3 { finalVal: Int }
struct Layer2 { nested3: Layer3 }
struct Layer1 { nested2: Layer2 }

contract MultiLayerTest {
    data: Layer1;

    init() {
        self.data = Layer1 {
            nested2: Layer2 {
                nested3: Layer3 {
                    finalVal: 42
                }
            }
        };
    }
}