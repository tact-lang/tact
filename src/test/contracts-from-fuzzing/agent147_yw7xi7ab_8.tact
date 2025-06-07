struct ManyFields {
  a: Int; b: Bool; c: String; d: Address; e: Cell;
  f: Slice; g: Int?; h: Bool?; i: String?; j: Address?;
  k: Cell?; l: Slice?;
}

contract Wide {
  field: ManyFields;

  init() {
    self.field = ManyFields{
      a:1, b:true, c:"s", d:myAddress(), e:emptyCell(),
      f:emptyCell().asSlice(), g:null, h:null, i:null, j:null,
      k:null, l:null
    };
  }
}