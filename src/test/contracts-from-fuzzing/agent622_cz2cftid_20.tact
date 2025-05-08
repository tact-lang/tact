struct StructAB {
  a: Int = 1;
  b: Bool = true;
}

struct StructC {
  s: StructAB;
  c: String = "hello";
}

contract PersistNested {
  data: StructC = StructC{s:StructAB{}, c:"hi"};
  init() {}
}