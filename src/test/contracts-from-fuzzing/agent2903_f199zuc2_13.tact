struct SInner {
  flag: Bool;
  text: String;
}

contract FieldOrder {
  first: Bool = true;
  second: SInner = SInner{ flag: false, text: "x" };
  third: Int = 33;
}