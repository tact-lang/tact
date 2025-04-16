struct Deep {
    a: Layer1;
}

struct Layer1 {
    b: Layer2;
}

struct Layer2 {
    c: Layer3;
}

struct Layer3 {
    d: Layer4;
}

struct Layer4 {
    e: Int?;
}

contract Test {
    data: Deep;

    init() {
        self.data = Deep{
            a: Layer1{
                b: Layer2{
                    c: Layer3{
                        d: Layer4{
                            e: null
                        }
                    }
                }
            }
        };
    }
}