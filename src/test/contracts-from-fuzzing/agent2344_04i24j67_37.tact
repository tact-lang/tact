struct Deep {
  a: Int;
  b: Bool;
  c: String;
}

struct Wrap {
  deep: Deep;
  more: Bool;
}

contract StructWrap {
  w: Wrap;

  init() {
    self.w = Wrap{
      deep: Deep{a:1,b:true,c:"hello"},
      more: false,
    };
  }
}