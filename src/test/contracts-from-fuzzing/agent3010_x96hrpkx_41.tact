struct DefaultsNest {
  foo: Int = 1;
  bar: Bool = false;
}

contract DirectDefault {
  field: DefaultsNest = DefaultsNest{};
}
