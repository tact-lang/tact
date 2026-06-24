struct Wide1 { f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; }
struct Wide2 { f6: Int; f7: Int; f8: Int; f9: Int; f10: Int; }

contract ManyStructs {
    w1: Wide1;
    w2: Wide2;

    init() {
        self.w1 = Wide1{f1:1,f2:2,f3:3,f4:4,f5:5};
        self.w2 = Wide2{f6:6,f7:7,f8:8,f9:9,f10:10};
    }
}