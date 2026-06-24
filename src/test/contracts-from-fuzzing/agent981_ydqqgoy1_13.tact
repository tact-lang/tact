struct A {
    f1: Bool; f2: Bool; f3: Bool; f4: Bool; f5: Bool;
    f6: Bool; f7: Bool; f8: Bool; f9: Bool; f10: Bool;
    f11: Bool; f12: Bool; f13: Bool; f14: Bool; f15: Bool;
    f16: Bool; f17: Bool; f18: Bool; f19: Bool; f20: Bool;
}

contract DenseBool {
    st: A;
    init(){
        self.st = A{
            f1:true,f2:true,f3:true,f4:true,f5:false,
            f6:true,f7:false,f8:true,f9:false,f10:true,
            f11:true,f12:true,f13:true,f14:true,f15:false,
            f16:false,f17:false,f18:true,f19:true,f20:true
        };
    }
}