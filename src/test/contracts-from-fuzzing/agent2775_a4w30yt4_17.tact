struct MultiBool {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract BoolPacking {
    m: MultiBool;

    init() {
        self.m = MultiBool{
            b1: true,
            b2: false,
            b3: true,
            b4: false
        };
    }
}
