struct TwoBools {
    x: Bool;
    y: Bool;
}

contract TestContract {
    f1: Bool;
    f2: Bool;
    s: TwoBools;
    init() {
        self.f1 = true;
        self.f2 = false;
        self.s = TwoBools{ x:false, y:true };
    }
}