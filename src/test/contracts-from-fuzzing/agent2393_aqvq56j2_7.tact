struct NestedOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptOpt {
  val: NestedOptionals = NestedOptionals{
    a: null,
    b: true,
    c: null
  };
}