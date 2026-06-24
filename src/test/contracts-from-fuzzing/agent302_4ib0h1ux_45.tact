struct Opts1 { a: Int? }
struct Opts2 { b: Opts1? }
struct Opts3 { c: Opts2? }

contract NestedNullables {
  val: Opts3;

  init() {
    self.val = Opts3{
      c: null
    };
  }
}