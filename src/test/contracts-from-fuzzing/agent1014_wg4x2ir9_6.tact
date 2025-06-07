struct DeepOptionals {
  inner: OptionalStruct?;
}

struct OptionalStruct {
  value: Int?;
}

contract TestContract {
  field: DeepOptionals = DeepOptionals{ inner: null };
}
