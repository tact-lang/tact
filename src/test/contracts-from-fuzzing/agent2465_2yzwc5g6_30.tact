// Deep nested optionals across multiple structs
struct Layer3 {
    val: Int?;
}

struct Layer2 {
    l: Layer3?;
}

struct Layer1 {
    m: Layer2?;
}

contract TestContract {
    top: Layer1?;
    
    init() {
        self.top = Layer1{
            m: Layer2{
                l: Layer3{
                    val: null
                }
            }
        };
    }
}