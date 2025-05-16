struct Long {
    a1:Int; a2:Int; a3:Int; a4:Int; a5:Int; a6:Int; a7:Int; a8:Int; a9:Int; a10:Int;
    b1:Bool; b2:Bool; b3:Bool; b4:Bool; b5:Bool; b6:Bool; b7:Bool; b8:Bool; b9:Bool; b10:Bool;
    s1:String; s2:String; s3:String; s4:String; s5:String; s6:String; s7:String; s8:String; s9:String; s10:String;
    c1:Cell; c2:Cell; c3:Cell; c4:Cell; c5:Cell; c6:Cell; c7:Cell; c8:Cell; c9:Cell; c10:Cell;
}
contract TestContract {
    x: Long;
    init() {
        self.x = Long{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            b1:true,b2:false,b3:true,b4:false,b5:true,b6:false,b7:true,b8:false,b9:true,b10:false,
            s1:"",s2:"",s3:"",s4:"",s5:"",s6:"",s7:"",s8:"",s9:"",s10:"",
            c1:emptyCell(),c2:emptyCell(),c3:emptyCell(),c4:emptyCell(),c5:emptyCell(),c6:emptyCell(),c7:emptyCell(),c8:emptyCell(),c9:emptyCell(),c10:emptyCell()
        };
    }
}