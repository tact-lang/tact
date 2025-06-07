struct BoolAndInt {
    a: Bool;
    b: Int;
}

contract MixedSimple {
    f1: BoolAndInt;
    f2: BoolAndInt;

    init() {
        self.f1 = BoolAndInt { a:true, b:42 };
        self.f2 = BoolAndInt { a:false, b:7 };
    }
}