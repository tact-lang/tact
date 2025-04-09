struct NestedMultiLayer {
    l1: Layer1;
}

struct Layer1 {
    l2: Layer2;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer3 {
    l4: Layer4;
}

struct Layer4 {
    val: Int;
}

contract TestContract {
    data: NestedMultiLayer;

    init() {
        self.data = NestedMultiLayer{
            l1: Layer1{
                l2: Layer2{
                    l3: Layer3{
                        l4: Layer4{ val: 101 }
                    }
                }
            }
        };
    }
}