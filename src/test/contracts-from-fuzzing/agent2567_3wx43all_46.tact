struct WrappedMany {
  a:Int; b:Bool; c:String; d:Cell; e:Slice; f:Builder ; g:Address;
  h:Int?; i:Bool?; j:String?; k:Address?
}
contract WrappedManyStorage {
  x:WrappedMany;
  init(){
    self.x=WrappedMany{
      a:1,b:true,c:"s",d:emptyCell(),e:emptyCell().asSlice(),f:beginCell(),g:myAddress(),
      h:null,i:false,j:"opt str",k:null
    };
  }
}