// Nested struct with serialization annotations
struct Ser1 { v: Int as int8; }
struct Ser2 { v: Ser1; }
struct Ser3 { v: Ser2; }

contract NestedSerialize {
  data: Ser3;

  init() {
    self.data = Ser3{
      v: Ser2{
        v: Ser1{v: -100}
      }
    };
  }
}