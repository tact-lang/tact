struct MiddleD {
  mval: Int;
}

struct OuterD {
  mid: MiddleD;
  otext: String;
}

contract DeepLayer {
  st: OuterD;

  init() {
    self.st = OuterD{
      mid: MiddleD{mval:87},
      otext: "txt"
    };
  }
}
