struct Wide {
    f1:Int;f2:Int;f3:Int;f4:Int;f5:Int;f6:Int;f7:Int;f8:Int;f9:Int;f10:Int;
    f11:Int;f12:Int;f13:Int;f14:Int;f15:Int;f16:Int;f17:Int;f18:Int;f19:Int;f20:Int;
    f21:Bool;f22:Bool;f23:Bool;f24:Bool;f25:Bool;f26:Bool;f27:Bool;f28:Bool;f29:Bool;f30:Bool;
}
contract TestContract {
    data: Wide;
    init(){
        self.data = Wide{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:11,f12:12,f13:13,f14:14,f15:15,f16:16,f17:17,f18:18,f19:19,f20:20,
            f21:true,f22:false,f23:true,f24:false,f25:true,f26:false,f27:true,f28:false,f29:true,f30:false
        };
    }
}