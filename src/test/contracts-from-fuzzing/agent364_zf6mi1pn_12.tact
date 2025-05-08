struct S2 {
    a: Int;
}

contract OptionalsChain {
    x: S2?;
    y: S2?;
    z: S2?;
    
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}