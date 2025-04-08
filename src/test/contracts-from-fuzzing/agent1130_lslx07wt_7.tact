struct OptionalStruct {
  x: Int;
  y: Bool;
}

contract NullableStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}