struct X {
    val: Int; 
    opt: Bool?;
}

struct WrapX {
    x: X;
}

struct DoubleWrapX {
    wx: WrapX;
}

contract ChainWrapNested {
    data: DoubleWrapX;

    init() {
        self.data = DoubleWrapX{
            wx: WrapX{ x: X{ val: 5, opt: true } }
        };
    }
}