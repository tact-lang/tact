// Compose many structs with mixed optional and default fields
struct One {
  foo: Int? = null;
}

struct Two {
  bar: String = "";
  nested: One;
}

struct Three {
  baz: Bool = false;
  nested: Two;
}

contract TestContract {
    t: Three;

    init() {
        self.t = Three{nested: Two{nested: One{}}};
    }

    receive() {
        if (self.t.nested.nested.foo != null) {
            let _ = self.t.nested.nested.foo!!;
        }
    }
}