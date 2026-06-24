// struct with a large number of fields including optionals and default
struct ManyAll {
  a: Int;
  b: Bool = true;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Address;
  h: Address?;
  i: Cell;
  j: Cell?;
  k: Slice;
  l: Slice?;
}
contract BigMixStruct {
  val: ManyAll;
  init() {
    self.val = ManyAll{
      a:1, c:"c", d:null, e:null, f:null, g:myAddress(), h:null, 
      i:emptyCell(), j:null, k:emptyCell().asSlice(), l:null
    };
  }
}