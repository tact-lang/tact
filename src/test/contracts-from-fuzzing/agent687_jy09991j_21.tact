struct UnusualOrder {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract OrderTest {
  val: UnusualOrder;

  init() {
    self.val = UnusualOrder{
      a:1,b:true,c:"x",d:null,e:null,f:null
    };
  }
}