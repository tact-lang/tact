struct Tiny1 { val: Int }
struct Tiny2 { val: Bool }

struct TinyNest {
  t1: Tiny1;
  t2: Tiny2;
}

struct ManyNested {
  n1: TinyNest;
  n2: TinyNest;
  n3: TinyNest;
}

contract TestContract {
  mn: ManyNested;
  init() {
    self.mn = ManyNested{
      n1: TinyNest{t1:Tiny1{val:1}, t2:Tiny2{val:true}},
      n2: TinyNest{t1:Tiny1{val:2}, t2:Tiny2{val:false}},
      n3: TinyNest{t1:Tiny1{val:3}, t2:Tiny2{val:true}}
    };
  }
}