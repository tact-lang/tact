struct X {
    val: Int;
}

struct Y {
    x: X;
}

struct Z {
    y: Y;
}

contract ManyNestedFields {
    f1: X;
    f2: Y;
    f3: Z;
    
    init() {
        self.f1 = X{val: 1};
        self.f2 = Y{x: X{val: 2}};
        self.f3 = Z{y: Y{x: X{val: 3}}};
    }
}
