struct Crazy {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Slice?;
  f: Cell?;
  g: Int = 42;
  h: Bool = true;
  i: String = "ok";
  j: Address;
}

contract ComplexStructStore {
  val: Crazy;
  init() {
    self.val = Crazy{
      a:null,b:null,c:null,d:null,e:null,f:null,
      g:123,h:false,i:"hi",j:myAddress()
    };
  }
  receive() {}
}