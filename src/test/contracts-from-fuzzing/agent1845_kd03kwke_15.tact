// Struct fields with nested optional bool and int
struct MulOpt {
  x: Bool?;
  y: Int?;
}
contract StructWithMulOption {
  s: MulOpt;
  init() {
    self.s = MulOpt{ x:null, y:null };
  }
}
