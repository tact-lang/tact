struct Part1 {
  a: Int;
  b: Bool;
}

struct Part2 {
  s: String;
  inner1: Part1;
}

struct Part3 {
  s2: String?;
  inner2: Part2;
}

contract ChainNestedOpt {
  p3: Part3;

  init() {
    self.p3 = Part3{
      s2: null,
      inner2: Part2{
        s: "str",
        inner1: Part1{a:1,b:true}
      }
    };
  }
}
