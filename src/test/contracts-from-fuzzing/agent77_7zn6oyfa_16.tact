// Test multiple nested optionals with a mix of defaults and explicit null
struct Bar {
 x: Int;
 y: Bool = false;
}

struct Baz {
 bar: Bar?;
 value: Int?;
}

contract MixOptNull {
 data: Baz;

 init() {
  self.data = Baz {
    bar: null,
    value: null
  };
 }
}