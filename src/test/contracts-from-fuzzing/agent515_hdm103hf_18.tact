struct X {
    a: Int;
    b: Bool;
}

contract ArraySim {
    x0: X;
    x1: X;
    x2: X;
    x3: X;

    init() {
        self.x0 = X{a:0,b:false};
        self.x1 = X{a:1,b:true};
        self.x2 = X{a:2,b:false};
        self.x3 = X{a:3,b:true};
    }
}
