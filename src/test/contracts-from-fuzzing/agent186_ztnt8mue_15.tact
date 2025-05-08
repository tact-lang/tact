// Struct containing also an optional nested struct
struct Possibly {
  id: Int;
  nested: Inner?;
}

struct Inner {
  note: String;
}

contract TestContract {
  val: Possibly;
  init() {
    self.val = Possibly{ id:1, nested: null };
  }
}