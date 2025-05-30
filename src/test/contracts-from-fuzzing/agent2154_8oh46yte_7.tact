struct NumNest {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
}

contract ListFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    
    arr: NumNest;

    init() {
        self.f1=1;self.f2=2;self.f3=3;
        self.f4=4;self.f5=5;self.f6=6;self.f7=7;
        self.arr = NumNest{x1:10,x2:20,x3:30,x4:40,x5:50};
    }
}