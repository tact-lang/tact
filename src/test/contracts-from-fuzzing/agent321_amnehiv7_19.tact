struct Nest1 { x: Int?; }
struct Nest2 { a: Nest1?; }
struct Nest3 { b: Nest2?; }
struct Nest4 { c: Nest3?; }

contract FourDeep {
  val: Nest4;

  init() {
    self.val = Nest4{ c: null };
  }
}