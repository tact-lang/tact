struct S1{f1:Int=1;f2:Int=2;f3:Int=3;f4:Int=4;f5:Int=5;f6:Int=6;f7:Int=7;f8:Int=8;f9:Int=9;f10:Int=10;f11:Int=11;f12:Int=12;f13:Int=13;f14:Int=14;f15:Int=15;}

contract ManyFields {
    s: S1;
    
    init() {
        self.s = S1{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10,f11:11,f12:12,f13:13,f14:14,f15:15,
        };
    }
}