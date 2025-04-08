struct LongStruct {
    f1:Int; f2:String; f3:Bool; f4:Int; f5:String;
    f6:Bool; f7:Int; f8:String; f9:Bool; f10:Int;
}

contract MultiTypeBig {
    val: LongStruct;

    init() {
        self.val = LongStruct{
            f1:1, f2:"a", f3:true, f4:4, f5:"b",
            f6:false, f7:7, f8:"c", f9:true, f10:10
        };
    }
}