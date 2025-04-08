// Deep nesting multiple layers optional fields interleaved
struct A { val: Int?; }
struct B { val: A?; }
struct C { val: B?; }
struct D { val: C?; }

contract TestContract {
  deep: D;

  init() {
    self.deep = D{
      val: C{
        val: null
      }
    };
  }
}