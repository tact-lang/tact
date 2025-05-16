struct Layer4 { val: Int?; }
struct Layer3 { next: Layer4; }
struct Layer2 { next: Layer3; }
struct Layer1 { next: Layer2; }

contract DeepOptional {
    top: Layer1;

    init() {
        self.top = Layer1{
            next: Layer2{
                next: Layer3{
                    next: Layer4{
                        val: null
                    }
                }
            }
        };
    }
}