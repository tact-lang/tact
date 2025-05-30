struct Data {
    a: Int;
    b: Bool;
}

contract Test {
    f0: Int;
    f1: Data;
    f2: Bool;
    f3: Int;
    init() {
        self.f0 = 0;
        self.f1 = Data{a:1,b:true};
        self.f2 = false;
        self.f3 = 3;
    }
}