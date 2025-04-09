struct InnerS {
    a: Int;
    b: Bool;
}

contract DefaultInitMix {
    x: Int = 5;
    y: InnerS = InnerS{a:1, b:true};

    init() {
        self.x = 10;
        self.y = InnerS{a:2, b:false};
    }
}