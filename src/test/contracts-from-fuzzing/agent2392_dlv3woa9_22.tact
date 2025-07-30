struct Sub {
    a: Int;
    b: Bool;
}

contract ManyStructs {
    f1: Sub;
    f2: Sub;
    f3: Sub;

    init() {
        self.f1 = Sub{a:1, b:true};
        self.f2 = Sub{a:2, b:false};
        self.f3 = Sub{a:3, b:true};
    }
}