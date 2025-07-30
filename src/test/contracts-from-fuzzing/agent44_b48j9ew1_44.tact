struct X {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract ManyOpts {
    x: X;

    init() {
        self.x = X{f1:null,f2:null,f3:null};
    }

    receive() {
        self.x = X{f1:5,f2:true,f3:"ok"};
    }
}