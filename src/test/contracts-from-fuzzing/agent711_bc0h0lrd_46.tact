struct Layer3 {
    c: Int;
}

struct Layer2 {
    b: Layer3;
}

struct Layer1 {
    a: Layer2;
}

contract NestedSimple {
    data: Layer1;

    init() {
        self.data = Layer1{
            a: Layer2{
                b: Layer3{
                    c:999
                }
            }
        };
    }
}
