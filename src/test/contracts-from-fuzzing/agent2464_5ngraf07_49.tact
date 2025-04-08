struct MaxPrimitiveStruct {
    i1:Int;i2:Int;i3:Int;i4:Int;i5:Int;
    b1:Bool; b2:Bool; b3:Bool; b4:Bool; b5:Bool;
    s1:String; s2:String; s3:String; s4:String; s5:String;
    a1:Address;a2:Address;a3:Address;a4:Address;a5:Address;
}

contract MaxPrimitive {
    ps: MaxPrimitiveStruct;
    init() {
        self.ps = MaxPrimitiveStruct{
            i1:1,i2:2,i3:3,i4:4,i5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
            a1:myAddress(),a2:myAddress(),a3:myAddress(),a4:myAddress(),a5:myAddress()
        };
    }
}
