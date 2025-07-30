struct DeepOptional {
  foo: Int;
  optBar: Bool?;
  optStr: String?;
}

contract ImplicitOptionalInit {
  config: DeepOptional = DeepOptional{ foo: 42 };
}