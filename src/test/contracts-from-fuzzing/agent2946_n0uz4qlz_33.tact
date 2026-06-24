struct Deep {
    one: Layer1;
}

struct Layer1 {
    two: Layer2;
}

struct Layer2 {
    three: Layer3;
}

struct Layer3 {
    four: Int;
}

contract VeryDeep {
    val: Deep;
    init() {
        self.val = Deep{
            one: Layer1{
                two: Layer2{
                    three: Layer3{
                        four: 99
                    }
                }
            }
        };
    }
}