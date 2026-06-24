struct Alpha { x: Int; y: Int; }
struct Beta { m: Bool; n: String; }
struct Gamma { p: Cell; q: Slice?; }

contract ManyFields {
  a: Alpha;
  b: Beta;
  c: Gamma;
  d: Int;
  e: Bool?;
  f: String;
  g: Address?;
  init() {
    self.a = Alpha{ x:1, y:2 };
    self.b = Beta{ m:true, n:"hi" };
    self.c = Gamma{ p:emptyCell(), q:null };
    self.d = 42;
    self.e = null;
    self.f = "hello";
    self.g = null;
  }
}