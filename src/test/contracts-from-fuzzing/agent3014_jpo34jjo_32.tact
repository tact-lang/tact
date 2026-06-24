// Large flat struct with many fields of different primitive types and optionals
struct LargeFlat {
 a: Int;
 b: Bool;
 c: Int?;
 d: Bool?;
 e: String;
 f: String?;
 g: Address;
 h: Address?;
 i: Cell;
 j: Cell?;
 k: Slice;
 l: Slice?;
}

contract LargeFlatTest {
  val: LargeFlat;
  init() {
    self.val = LargeFlat{
      a:1, b:true, c:null, d:null, e:"hi", f:null, g:myAddress(), h:null, i:emptyCell(), j:null, k:emptyCell().asSlice(), l:null
    };
  }
}