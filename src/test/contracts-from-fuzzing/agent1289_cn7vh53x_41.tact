// Struct with >20 fields, various types, optional + serialization
struct BigOne {
  a:Int; b:Bool; c:String; d:Cell; e:Slice; f:Address;
  g:Int?; h:Bool?; i:String?; j:Cell?; k:Slice?; l:Address?;
  m:Int as uint8; n:Int as int32; o:Int as coins;
  p:Int? as uint8; q:Int? as int32; r:Int? as coins;
  s:Bool; t:Bool?; u:String;
}

contract BigStructTest {
  rec: BigOne;

  init() {
    self.rec = BigOne{
      a:1,b:false,c:"hi",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress(),
      g:null,h:null,i:null,j:null,k:null,l:null,
      m:2,n:-3,o:ton("1"),
      p:null,q:null,r:null,
      s:true,t:null,u:"bye"
    };
  }
}
