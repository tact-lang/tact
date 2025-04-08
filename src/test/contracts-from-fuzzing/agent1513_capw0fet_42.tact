struct Slim {
    i: Int;
}

struct WrapInt {
    w: Slim;
}

contract DoubleWrap {
    a: WrapInt;
    b: Slim;
    
    init() {
        self.a = WrapInt{ w: Slim{ i:1 } };
        self.b = Slim{ i:2 };
    }
}