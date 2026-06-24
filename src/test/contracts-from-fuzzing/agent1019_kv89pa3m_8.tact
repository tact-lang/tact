struct Lvl1 { a: Int; }
struct Lvl2 { b: Lvl1; }
struct Lvl3 { c: Lvl2; }
struct Lvl4 { d: Lvl3; }
struct Lvl5 { e: Lvl4; }

contract FiveDeep {
  val: Lvl5;

  init() {
    self.val = Lvl5{ e: Lvl4{ d: Lvl3{ c: Lvl2{ b: Lvl1{ a: 99 } } } } };
  }
}
