struct Layer1 { x: Int; }
struct Layer2 { l1: Layer1; }
struct Layer3 { l2: Layer2; }
struct Layer4 { l3: Layer3; }

contract MixedOptionals {
    val1: Layer4? = null;
    val2: Layer4? = null;

    init() {
        self.val1 = Layer4{
            l3: Layer3{
                l2: Layer2{
                    l1: Layer1{ x: 99 }
                }
            }
        };
        self.val2 = null;
    }
}