struct Serr {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int;
    f5: String;
    f6: Bool;
}

contract TwoSerrs {
    s1: Serr;
    s2: Serr;

    init() {
        self.s1 = Serr{f1:1, f2:"a", f3:true, f4:2, f5:"b", f6:false};
        self.s2 = Serr{f1:3, f2:"c", f3:true, f4:4, f5:"d", f6:true};
    }
}