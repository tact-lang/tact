struct DeepNested3 { val: Int; }
struct DeepNested2 { inner3: DeepNested3; }
struct DeepNested1 { inner2: DeepNested2; }

contract DeepContract {
  field: DeepNested1;

  init() {
    self.field = DeepNested1{
      inner2: DeepNested2{
        inner3: DeepNested3{ val: 123 },
      },
    };
  }
}