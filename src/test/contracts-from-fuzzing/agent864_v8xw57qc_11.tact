struct Arr1 {
    f0: Int; f1: Int; f2: Int; f3: Int; f4: Int;
}
struct Arr2 {
    f5: Int; f6: Int; f7: Int; f8: Int; f9: Int;
}

contract ManyStructs {
    a1: Arr1;
    a2: Arr2;
    init() {
        self.a1 = Arr1{ f0:0,f1:1,f2:2,f3:3,f4:4 };
        self.a2 = Arr2{ f5:5,f6:6,f7:7,f8:8,f9:9 };
    }
    receive() {
        self.a1 = Arr1{ f0:10,f1:11,f2:12,f3:13,f4:14 };
        self.a2 = Arr2{ f5:15,f6:16,f7:17,f8:18,f9:19 };
    }
}