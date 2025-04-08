struct BigNesting {
    n1: Int;
    n2: Layer2;
}

struct Layer2 {
    n3: Int;
    n4: Layer3;
}

struct Layer3 {
    n5: Int;
    n6: Layer4;
}

struct Layer4 {
    last: Int;
}

contract ComplexNest {
    val: BigNesting;

    init() {
        self.val = BigNesting{
            n1:1,
            n2: Layer2{
                n3:2,
                n4: Layer3{
                    n5:3,
                    n6: Layer4{
                        last:4
                    }
                }
            }
        };
    }
}
