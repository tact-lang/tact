struct Large1 {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
}

contract ManyFieldsContract {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    payload: Large1;
    
    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
        self.f6 = 6;
        self.f7 = 7;
        self.f8 = 8;
        self.f9 = 9;
        self.f10 = 10;
        self.payload = Large1{
            a1:1, a2:2, a3:3, a4:4, a5:5, 
            a6:6, a7:7, a8:8, a9:9, a10:10
        };
    }
}