struct Complex {
 a: Int = 1;
 b: String?;
 c: Bool = false;
 d: String = "";
 e: Bool?;
 f: Address;
 g: Address?;
 h: Slice;
 i: Slice?;
 j: Cell;
 k: Cell?;
}

contract Mixed {
  val: Complex;
  init() {
    self.val = Complex{
      b:null, e:null, g:null, i:null, k:null,
      a:1, c:true, d:"123", f:myAddress(), h:emptyCell().asSlice(), j:emptyCell()
    };
  }
}