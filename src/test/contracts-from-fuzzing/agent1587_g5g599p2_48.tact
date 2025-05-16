struct A {x: Int; optY: Int?;}
struct B {flag: Bool; str: String;}
struct Top {
  a: A;
  b: B;
  optS: String?;
}

contract ComposeMany {
  val: Top;
  init() {
    self.val = Top{
      a: A{x: 5, optY: null},
      b: B{flag:true, str:"x"},
      optS:null
    };
  }
}