struct SA { x: Int?; }
struct SB { a: SA?; }
struct SC { b: SB?; }

contract OptNestMany {
  deep: SC;

  init() {
    self.deep = SC{ b: null };
  }
}
