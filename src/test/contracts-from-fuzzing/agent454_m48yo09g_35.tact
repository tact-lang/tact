struct A {v:Int}
struct B {v:Int}
struct C {v:Int}

struct ABOpt {
  a:A?;
  b:B?;
  c:C?;
}

contract NullableComponents {
  comp: ABOpt;
  init() {
    self.comp = ABOpt{a:null,b:null,c:null};
  }
}