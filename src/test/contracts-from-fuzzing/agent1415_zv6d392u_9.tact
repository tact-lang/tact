struct Sub {
  a: Int;
  b: Bool;
  c: String;
}

struct Super {
  f1: Int;
  f2: Sub;
  f3: Sub;
  f4: Sub;
}

contract TestContract {
  s: Super;

  init() {
    self.s = Super{
      f1: 1,
      f2: Sub{a:2,b:true,c:"x"},
      f3: Sub{a:3,b:false,c:"y"},
      f4: Sub{a:4,b:true,c:"z"},
    };
  }
}