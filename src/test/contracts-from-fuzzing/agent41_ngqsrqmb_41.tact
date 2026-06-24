// Struct with very large number of mixed primitive fields, used as persistent variable
struct Massive {
  a1:Int; a2:Int; a3:Int; a4:Int; a5:Int; a6:Int; a7:Int; a8:Int; a9:Int; a10:Int;
  b1:Bool; b2:Bool; b3:Bool; b4:Bool; b5:Bool;
  s1:String; s2:String; s3:String; s4:String; s5:String;
  addr1:Address; addr2:Address; addr3:Address;
  c1:Cell; c2:Cell; c3:Cell;
  sl1:Slice; sl2:Slice; sl3:Slice;
}

contract HugeStruct {
  payload: Massive;
  init(){
    self.payload = Massive{
      a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
      b1:true,b2:false,b3:true,b4:false,b5:true,
      s1:"s1",s2:"s2",s3:"s3",s4:"s4",s5:"s5",
      addr1:myAddress(),addr2:myAddress(),addr3:myAddress(),
      c1:emptyCell(),c2:emptyCell(),c3:emptyCell(),
      sl1:emptyCell().asSlice(),sl2:emptyCell().asSlice(),sl3:emptyCell().asSlice(),
    };
  }
}