struct PrimWrap {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
}

contract PrimWrapContract {
  data: PrimWrap;

  init(){
    self.data = PrimWrap{i:1,b:true,s:"x",a:myAddress()};
  }
}