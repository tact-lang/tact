// Large persistent struct, different types
struct Large {
  a1: Int;
  a2: String;
  a3: Bool;
  a4: Address;
  a5: Cell;
  a6: Slice;
  a7: Builder;
  a8: Int?;
  a9: String?;
  a10: Bool?;
}

contract StructLarge {
  s: Large;

  init() {
    self.s = Large{
      a1:1,a2:"x",a3:true,a4:myAddress(),a5:emptyCell(),a6:emptyCell().asSlice(),a7:beginCell(),a8:null,a9:null,a10:false
    };
  }
}
