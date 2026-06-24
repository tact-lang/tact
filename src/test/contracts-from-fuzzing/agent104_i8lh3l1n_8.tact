struct DeeplyOptional {
  a: Int?;
  b: Bool?;
}

struct OptionalHolder {
  inner: DeeplyOptional?;
}

contract OptionalContract {
  field: OptionalHolder?;

  init() {
    self.field = OptionalHolder{
      inner: DeeplyOptional{
        a: 42,
        b: true,
      }
    };
  }
}
