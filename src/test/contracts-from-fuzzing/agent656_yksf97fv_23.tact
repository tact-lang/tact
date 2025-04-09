struct InnerLevel {
  a: Int;
}

struct MidLevel {
  nested: InnerLevel?;
  flag: Bool;
}

struct TopLevel {
  mid: MidLevel?;
  b: String;
}

contract OptionalCascade(
  val: TopLevel?,
  ready: Bool,
  count: Int,
) {
}