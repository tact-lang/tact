struct Basic {
    n: Int;
    b: Bool;
    s: String;
}

contract TestContract {
    f1: Basic;
    f2: Basic;
    f3: Basic;

    init() {
        self.f1 = Basic{n:1,b:true,s:"a"};
        self.f2 = Basic{n:2,b:false,s:"b"};
        self.f3 = Basic{n:3,b:true,s:"c"};
    }
}
