// Persistent struct with optional and deeply nested multiple levels
struct Third {
  foo: Int;
}

struct Second {
  bar: Third?;
}

struct First {
  baz: Second?;
}

contract DeepNull {
    store: First;

    init() {
        self.store = First{
            baz: null
        };
    }
}
