struct Duo {
    a: Int;
    b: Bool;
}

contract MultiDuo {
    f1: Duo;
    f2: Duo;
    f3: Duo;
    
    init() {
        self.f1 = Duo{ a:1, b:true };
        self.f2 = Duo{ a:2, b:false };
        self.f3 = Duo{ a:3, b:true };
    }
}