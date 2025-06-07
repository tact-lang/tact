struct Sub {
    a: Int;
    b: Bool;
}

contract TestContract {
    a: Int = 1;
    b: Bool = false;
    s: String = "x";
    o1: Int?;
    o2: Bool?;
    o3: String?;
    s1: Sub;
    s2: Sub?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.s1 = Sub{a:42,b:true};
        self.s2 = null;
    }
}