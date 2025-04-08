struct DefaultsStyle {
  foo: Int = 1;
  bar: Bool = false;
}

contract OverwriteDefaults {
  val: DefaultsStyle;

  init() {
    self.val = DefaultsStyle{ foo: 99, bar: true };
  }
}
