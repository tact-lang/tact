struct Composite {
    flag: Bool;
    txt: String;
    num: Int;
}

contract CompositeArray {
    f1: Composite;
    f2: Composite;
    f3: Composite;

    init() {
        self.f1 = Composite{flag:true, txt:"x", num:1};
        self.f2 = Composite{flag:false, txt:"y", num:2};
        self.f3 = Composite{flag:true, txt:"z", num:3};
    }
}