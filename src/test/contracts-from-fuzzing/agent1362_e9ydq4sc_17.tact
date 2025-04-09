struct Layer3 {
    value: Int;
}

struct Layer2 {
    a: Int;
    b: Layer3;
}

struct Layer1 {
    c: Bool;
    d: Layer2;
}

contract Test {
    s: Layer1;

    init() {
        self.s = Layer1{
            c:true,
            d:Layer2{
                a:5,
                b:Layer3{
                    value:7
                }
            }
        };
    }
    receive() {}
}