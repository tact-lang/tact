struct OptionalLayered {
    first: Layer1?;
}

struct Layer1 {
    second: Layer2?;
}

struct Layer2 {
    val: Int;
}

contract TestContract {
    s: OptionalLayered;
    
    init() {
        self.s = OptionalLayered{
            first: Layer1{
                second: Layer2{val: 42}
            }
        };
    }
}
