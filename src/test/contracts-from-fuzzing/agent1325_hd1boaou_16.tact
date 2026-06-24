struct Combo {
 a: Int;
 b: Bool;
 c: Int?;
 d: Bool?;
 e: Int;
 f: Bool;
 g: Int?;
 h: Bool?;
}

contract TestContract {
 combo: Combo;

 init() {
  self.combo = Combo{
    a: 1,
    b: false,
    c: null,
    d: null,
    e: 2,
    f: true,
    g: 3,
    h: false
  };
 }

 receive() {
  self.combo = self.combo;
 }
}