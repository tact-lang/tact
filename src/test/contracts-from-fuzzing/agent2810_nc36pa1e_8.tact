struct Layer3 { z: Int }
struct Layer2 { b: Layer3 }
struct Layer1 { a: Layer2 }

contract DeepContract {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            a: Layer2{
                b: Layer3{z:42}
            }
        };
    }
}
