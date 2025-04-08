// Struct with many bools and optionals
struct ManyBools {
  a: Bool;
  b: Bool?;
  c: Bool;
  d: Bool?;
  e: Bool;
  f: Bool?;
  g: Bool;
  h: Bool?;
}

contract TestContract {
  flags: ManyBools;

  init() {
    self.flags = ManyBools{
      a:true, b:null, c:false, d:true, e:false, f:null, g:true, h:false
    };
  }
}