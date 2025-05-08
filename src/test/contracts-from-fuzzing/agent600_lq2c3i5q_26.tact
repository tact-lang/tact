// Struct with >20 fields, some optionals, some nested
struct M {
  a:Int;b:Int;c:Int?;d:Int?;e:Int;
  f:Bool?;g:Bool;h:String;i:Address;j:Slice;
  k:Cell;l:String?;m:Address?;n:Slice?;o:Cell?;
  p:Int;q:Int;r:Bool;s:String;t:Address;
}

contract WideMixStruct {
  data:M;

  init() {
    self.data = M{
      a:1,b:2,c:null,d:null,e:5,
      f:null,g:true,h:"hi",i:myAddress(),j:emptyCell().asSlice(),
      k:emptyCell(),l:null,m:null,n:null,o:null,
      p:9,q:10,r:false,s:"yo",t:myAddress()
    };
  }
}