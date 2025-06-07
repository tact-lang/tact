struct Rec {
 a: Int;
 b: Rec2;
}
struct Rec2 {
 c: Int;
 d: Rec3;
}
struct Rec3 {
 e: Int;
}
contract ChainC {
 val: Rec;
 init() {
  self.val = Rec{ a:1, b: Rec2{ c:2, d:Rec3{e:3} } };
 }
}