struct ManyFields {
 a: Int; b: Int?; c: Bool; d: Bool?; e: String; f: String?; g: Address; h: Address?; i: Cell; j: Cell?; k: Slice; l: Slice?;
}
contract BigVariety {
  payload: ManyFields;
  init() {
    self.payload = ManyFields{
     a:1, b:null, c:true, d:false, e:"hi", f:null, g:myAddress(), h:null, i:emptyCell(), j:null, k:emptyCell().asSlice(), l:null
    };
  }
}
