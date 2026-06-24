struct RepeatedBool {
    flagA: Bool;
    flagB: Bool;
    flagC: Bool;
    flagD: Bool;
}

struct IntLayer {
    n1: Int;
    n2: Int;
}

contract MixPersist {
    rb: RepeatedBool;
    il: IntLayer;

    init() {
        self.rb = RepeatedBool{flagA:true,flagB:false,flagC:true,flagD:false};
        self.il = IntLayer{n1:123,n2:456};
    }
}