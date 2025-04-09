struct InA {
 v: Int;
}

struct InB {
 t: String;
}

contract MixNestedOptionals(
  a: InA?,
  b: InB?,
  x: Int?,
  y: Bool?,
  z: String?,
  active: Bool,
  info: String,
) { }