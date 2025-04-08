struct Layer1 {
    l2: Layer2?;
}

struct Layer2 {
    l3: Layer3?;
}

struct Layer3 {
    l4: Layer4?;
}

struct Layer4 {
    val: Int?;
}

contract TestContract {
    nested: Layer1;
    init() {
        self.nested = Layer1{
            l2: Layer2{
                l3: Layer3{
                    l4: Layer4{ val: null }
                }
            }
        };
    }
}