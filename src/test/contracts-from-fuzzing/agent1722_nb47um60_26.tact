struct Flatten {
    a: Int;
    b: Bool;
}

contract MultiFlat {
    f1: Flatten;
    f2: Flatten;
    
    init() {
        self.f1 = Flatten{ a:1, b:true };
        self.f2 = Flatten{ a:2, b:false };
    }
}