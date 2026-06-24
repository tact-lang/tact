struct XY {
    x: Int;
    y: Bool;
}

struct WrapXY {
    first: XY;
    second: XY;
}

contract DblWrap {
    pair: WrapXY;
    init() {
        self.pair = WrapXY{
            first: XY{ x:1, y:true },
            second: XY{ x:2, y:false }
        };
    }
}