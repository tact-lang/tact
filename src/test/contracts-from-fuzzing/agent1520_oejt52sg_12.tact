struct Layer3 {
    flag3: Bool;
}

struct Layer2 {
    nested3: Layer3;
}

struct Layer1 {
    nested2: Layer2;
}

struct Root {
    nested1: Layer1;
}

contract VeryDeep {
    state: Root;

    init() {
        self.state = Root{
            nested1: Layer1{
                nested2: Layer2{
                    nested3: Layer3{
                        flag3: true
                    }
                }
            }
        };
    }
}