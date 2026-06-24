struct Sub1 {
  x: Int;
}

struct Sub2 {
  y: Bool;
}

struct Sub3 {
  s: String;
}

struct ContainerAll {
  a: Sub1;
  b: Sub2;
  c: Sub3;
}

contract ManySubs {
  val: ContainerAll;

  init() {
    self.val = ContainerAll{
      a: Sub1{x: 99},
      b: Sub2{y: true},
      c: Sub3{s: "done"}
    };
  }
}