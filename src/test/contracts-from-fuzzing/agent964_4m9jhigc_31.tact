struct ExtremelyNested {
  inner: OptionLayer1?;
}

struct OptionLayer1 {
  layer2: OptionLayer2?;
}

struct OptionLayer2 {
  s: String?;
}

contract DeepNullableStructs {
  field: ExtremelyNested;

  init() {
    self.field = ExtremelyNested{ inner: OptionLayer1{ layer2: OptionLayer2{ s: "level" } } };
  }
}
