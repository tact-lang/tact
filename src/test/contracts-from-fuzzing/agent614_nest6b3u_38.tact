struct X { a:Int; }

struct Nest {
  x: X;
  flag: Bool;
  optStr: String?;
  num:Int;
}

contract OptDeep {
  n: Nest?;

  init() {
    self.n = Nest{
      x:X{a:42},
      flag:true,
      optStr:null,
      num:7
    };
  }
}