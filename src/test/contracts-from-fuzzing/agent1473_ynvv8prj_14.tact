struct Sub {
    a: Int;
    b: Bool;
}

contract TestContract {
    sub1: Sub;
    sub2: Sub;
    sub3: Sub;
    sub4: Sub;
    sub5: Sub;

    init() {
        self.sub1 = Sub{a:1,b:true};
        self.sub2 = Sub{a:2,b:false};
        self.sub3 = Sub{a:3,b:true};
        self.sub4 = Sub{a:4,b:false};
        self.sub5 = Sub{a:5,b:true};
    }
}