struct TwoOpt {
    x: Int?;
    y: Int?;
}

struct OuterOpt {
    a: TwoOpt;
    b: Int;
}

contract DoubleOptionals {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{ a: TwoOpt{ x:null, y:5 }, b: 42 };
    }
}