struct BigStruct {
    x1:Int; x2:Int; x3:Int; x4:Int; x5:Int; x6:Int; x7:Int; x8:Int; x9:Int; x10:Int;
    y1:Bool; y2:Bool; y3:Bool; y4:Bool; y5:Bool; y6:Bool; y7:Bool; y8:Bool; y9:Bool; y10:Bool;
    s1:String;s2:String;s3:String;s4:String;s5:String;s6:String;s7:String;s8:String;s9:String;s10:String;
}

contract HugeStructContract{
    big: BigStruct;
    init(){
        self.big = BigStruct{
            x1:1,x2:1,x3:1,x4:1,x5:1,x6:1,x7:1,x8:1,x9:1,x10:1,
            y1:true,y2:false,y3:true,y4:false,y5:true,y6:false,y7:true,y8:false,y9:true,y10:false,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",s6:"f",s7:"g",s8:"h",s9:"i",s10:"j"
        };
    }
}