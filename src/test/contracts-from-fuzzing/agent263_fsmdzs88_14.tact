struct A {
  i: Int;
  b: Bool;
  s: String;
}
struct B {
  a: A;
  s: String;
  f: Bool?;
}

contract Combos {
  val: B;
  init() {
    self.val = B{a: A{i:42,b:true,s:"hi"},s:"yo",f:null};
  }
}