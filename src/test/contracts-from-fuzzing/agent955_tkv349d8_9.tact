struct Layer3 { s: String; }
struct Layer2 { l3: Layer3; }
struct Layer1 { l2: Layer2; }

contract DeepLayersTest {
    state: Layer1;

    init() {
        self.state = Layer1{
            l2: Layer2{
                l3: Layer3{
                    s: "test"
                }
            }
        };
    }
}