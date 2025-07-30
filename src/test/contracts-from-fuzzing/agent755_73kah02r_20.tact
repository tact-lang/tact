struct NestedOpt {
  foo: Int;
}

contract Test17(
  data: NestedOpt?,
) {
  get fun is_present(): Bool {
    return self.data != null;
  }
}
