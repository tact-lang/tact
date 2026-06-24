// very wide struct with many optionals, ints, booleans
struct WideOptional {
 a: Int?;
 b: Int?;
 c: Int?;
 d: Bool?;
 e: Bool?;
 f: Bool?;
 g: String?;
 h: String?;
 i: Address?;
 j: Address?;
 k: Cell?;
 l: Cell?;
 m: Slice?;
 n: Slice?;
}

contract WideOptionalContract {
  val: WideOptional;

  init() {
    self.val = WideOptional{
      a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null,k:null,l:null,m:null,n:null
    };
  }
}