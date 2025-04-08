struct OptionalStruct {
  x: Int?;
  y: Bool?;
}

contract TestContract {
  optField: OptionalStruct = OptionalStruct{ x: null, y: null };
}
