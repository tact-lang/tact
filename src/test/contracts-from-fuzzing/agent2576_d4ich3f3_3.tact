struct Deep {
    a: Bool;
    b: String;
}

struct Middle {
    deep1: Deep;
    deep2: Deep;
}

contract DoubleNested {
    mid: Middle;

    init() {
        self.mid = Middle{
            deep1: Deep{a:true,b:"x"},
            deep2: Deep{a:false,b:"y"}
        };
    }
}