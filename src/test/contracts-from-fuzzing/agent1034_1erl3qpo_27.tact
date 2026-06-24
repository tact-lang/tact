struct P {
    x: Int;
    y: Int = 99;
}

contract PartialDefaults {
    s: P;
    
    init() {
        self.s = P{ x: 5 };
    }
}