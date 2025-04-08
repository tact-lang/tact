struct Sub {
    a: Bool;
    b: Int;
}

contract ArrayLikePacked {
    f1: Sub;
    f2: Sub;
    f3: Sub;
    f4: Sub;

    init() {
        self.f1 = Sub{a:true, b:1};
        self.f2 = Sub{a:false,b:2};
        self.f3 = Sub{a:true,b:3};
        self.f4 = Sub{a:false,b:4};
    }
}