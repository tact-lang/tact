struct X {
    a: Int;
}
struct Y {
    b: Int;
}
struct Z {
    x: X;
    y: Y;
}

contract Multilevel {
    d1: X;
    d2: Y;
    d3: Z;

    init() {
        self.d1 = X{a:1};
        self.d2 = Y{b:2};
        self.d3 = Z{x:X{a:3}, y:Y{b:4}};
    }
}