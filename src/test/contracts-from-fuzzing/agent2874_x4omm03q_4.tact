struct Data {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "a";
    f4: Int = 2;
    f5: Bool = true;
    f6: String = "b";
    f7: Data = Data{a:7,b:true,c:"c"};
    f8: Data = Data{a:8,b:false,c:"d"};
    f9: Int = 9;
    f10: Bool = false;

    init() {
        self.f1 = 11;
        self.f2 = true;
        self.f3 = "x";
        self.f4 = 22;
        self.f5 = false;
        self.f6 = "y";
        self.f7 = Data{a:77,b:false,c:"z"};
        self.f8 = Data{a:88,b:true,c:"w"};
        self.f9 = 99;
        self.f10 = true;
    }
}
