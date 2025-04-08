struct SubSub {
  x: Int;
}

struct Sub {
  s: SubSub;
}

struct Top {
  sub: Sub;
}

contract Chain {
  val: Top;

  init() {
    self.val = Top{
      sub: Sub{
        s: SubSub{
          x: 1
        }
      }
    };
  }
}