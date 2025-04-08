struct Tiny1 { a: Int }
struct Tiny2 { b: Int }
struct Tiny3 { c: Int }

struct Combo {
  t1: Tiny1;
  t2: Tiny2;
  t3: Tiny3;
}

contract MultiTinyStructStorage {
  val: Combo;
  init() {
    self.val = Combo{
      t1: Tiny1{a:1}, t2: Tiny2{b:2}, t3: Tiny3{c:3}
    };
  }
}