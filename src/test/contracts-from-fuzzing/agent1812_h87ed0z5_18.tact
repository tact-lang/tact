// Edge case: deeply nested optional + default inner optional as null
struct Nest1 {
  foo: Nest2?;
}

struct Nest2 {
  bar: Nest3?;
}

struct Nest3 {
  x: Int?;
}

contract DeepNullDefaults {
  data: Nest1;

  init() {
    self.data = Nest1 { foo: null };
  }
}