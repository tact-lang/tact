struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: Int?;
    d: Bool?;
}

contract MixedNest {
    in1: Inner1;
    in2: Inner2;
    
    init() {
        self.in1 = Inner1{ a: 3, b: true };
        self.in2 = Inner2{ c: null, d: false };
    }
}