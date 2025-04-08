struct WideFlat {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Bool; f7: Bool; f8: Bool; f9: Bool; f10: Bool;
    f11: String; f12: String; f13: String; f14: String; f15: String;
    f16: Address; f17: Address; f18: Address; f19: Address; f20: Address;
}

contract WideFlatContract {
    data: WideFlat;

    init() {
        self.data = WideFlat{
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:true,f7:false,f8:true,f9:false,f10:true,
            f11:"a",f12:"b",f13:"c",f14:"d",f15:"e",
            f16:myAddress(), f17:myAddress(), f18:myAddress(), f19:myAddress(), f20:myAddress()
        };
    }
}