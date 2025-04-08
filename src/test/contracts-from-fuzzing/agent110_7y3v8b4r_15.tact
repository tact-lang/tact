struct Layer1 {
    v1: Int;
}

struct Layer2 {
    nested: Layer1;
}

struct Layer3 {
    nested: Layer2;
}

struct Layer4 {
    nested: Layer3;
}

struct Layer5 {
    nested: Layer4;
}

contract Wrap5 {
    content: Layer5;

    init() {
        self.content = Layer5{
            nested: Layer4{
                nested: Layer3{
                    nested: Layer2{
                        nested: Layer1{
                            v1: 42
                        }
                    }
                }
            }
        };
    }
}
