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
    l5: Layer5;
}

struct Layer5 {
    l6: Layer6;
}

struct Layer6 {
    value: Int;
}

contract TestContract {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            l2: Layer2{
                l3: Layer3{
                    l4: Layer4{
                        l5: Layer5{
                            l6: Layer6{
                                value: 999
                            }
                        }
                    }
                }
            }
        };
    }
}