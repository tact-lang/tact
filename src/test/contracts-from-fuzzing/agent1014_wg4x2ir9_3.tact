struct OptionalNested {
  inner: Int?;
}

contract TestContract {
  nestedOpt: OptionalNested = OptionalNested{ inner: null };
}
