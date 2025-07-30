struct X {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
 f: String?;
 g: Int;
 h: String;
}

contract NestedOptDeep {
 val: X?;

 init() {
  self.val = null;
 }
}