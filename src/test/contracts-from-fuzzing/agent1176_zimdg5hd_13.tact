struct Info {
  label: String;
}

contract ImplicitNulls {
  a: Int?;
  b: Bool?;
  s: Info?;

  init() {
    // none assigned, so null implied
  }
}