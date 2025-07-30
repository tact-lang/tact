struct X { a:Int } 

contract ManyStructsDirect {
    s1: X;
    s2: X;
    s3: X;
    s4: X;
    s5: X;

    init() {
        self.s1 = X{a:1};
        self.s2 = X{a:2};
        self.s3 = X{a:3};
        self.s4 = X{a:4};
        self.s5 = X{a:5};
    }
}