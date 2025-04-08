// Test default values combined with explicit init in nested struct
struct Inner {
  x: Int = 3;
  y: Bool = true;
}

struct Outer {
  nested: Inner;
  s: String = "abc";
}

contract DefaultsNested {
  data: Outer;

  init() {
    self.data = Outer{
      nested: Inner{
        x: 5,
        y: false
      },
      s: "zzz"
    };
  }
}