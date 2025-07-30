struct BigS {
    a1:Int;a2:Int;a3:Int;a4:Int;a5:Int;a6:Int;a7:Int;a8:Int;a9:Int;a10:Int;
    b1:Bool;b2:Bool;b3:Bool;b4:Bool;b5:Bool;b6:Bool;b7:Bool;b8:Bool;b9:Bool;b10:Bool;
    s1:String;s2:String;s3:String;s4:String;s5:String;
}

contract BigStructTest {
    x:BigS;
    init() {
        self.x = BigS{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            b1:true,b2:true,b3:true,b4:false,b5:false,b6:true,b7:false,b8:true,b9:false,b10:true,
            s1:"one",s2:"two",s3:"three",s4:"four",s5:"five"
        };
    }
}