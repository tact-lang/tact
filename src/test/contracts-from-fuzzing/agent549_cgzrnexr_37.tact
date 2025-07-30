struct Duo {
    a: Int;
    b: Bool;
}

contract LongList {
    f1: Duo;
    f2: Duo;
    f3: Duo;
    f4: Duo;
    f5: Duo;
    f6: Duo;
    f7: Duo;
    f8: Duo;
    f9: Duo;
    f10: Duo;

    init() {
        self.f1 = Duo{a:1,b:true};
        self.f2 = Duo{a:2,b:false};
        self.f3 = Duo{a:3,b:true};
        self.f4 = Duo{a:4,b:false};
        self.f5 = Duo{a:5,b:true};
        self.f6 = Duo{a:6,b:false};
        self.f7 = Duo{a:7,b:true};
        self.f8 = Duo{a:8,b:false};
        self.f9 = Duo{a:9,b:true};
        self.f10 = Duo{a:10,b:true};
    }

    receive() {
        let _ = self.f1;
    }
}