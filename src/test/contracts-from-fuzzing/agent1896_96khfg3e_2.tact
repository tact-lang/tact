struct DeepNested {
  x: Int;
  y: String;
  z: EvenDeeper;
}

struct EvenDeeper {
  val: Int;
  label: String;
}

contract NestedFields {
  field: DeepNested;

  init() {
    self.field = DeepNested{
      x: 1,
      y: "test",
      z: EvenDeeper{
        val: 42,
        label: "deep"
      }
    };
  }
}