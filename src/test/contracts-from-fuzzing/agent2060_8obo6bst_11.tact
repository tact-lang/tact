struct NullableAddressWrapper {
  val: Address? = null;
}

contract StructWithOptionalAddressDefault {
  field: NullableAddressWrapper;
  init() {
    self.field = NullableAddressWrapper{};
  }
}