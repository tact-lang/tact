// optional struct field
struct OptStructHolder {
  nested: Nested?;
}

struct Nested {
  a: Int;
  flag: Bool;
}

contract TestContract {
  val: OptStructHolder;
  init() {
    self.val = OptStructHolder{nested: null};
  }
}