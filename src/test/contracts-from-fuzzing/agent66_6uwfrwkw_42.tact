struct X {
    a: Int;
    b: Int?;
    c: Int;
}

contract MixNullStraight {
    x: X;

    init() {
        self.x = X{
            a:1,
            b:null,
            c:3
        };
    }
}