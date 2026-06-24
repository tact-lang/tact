struct ABool {
    flag: Bool;
}

contract BoolArray {
    f1: ABool;
    f2: ABool;
    f3: ABool;
    f4: ABool;
    f5: ABool;

    init() {
        self.f1 = ABool{ flag:true };
        self.f2 = ABool{ flag:false };
        self.f3 = ABool{ flag:true };
        self.f4 = ABool{ flag:false };
        self.f5 = ABool{ flag:true };
    }
}