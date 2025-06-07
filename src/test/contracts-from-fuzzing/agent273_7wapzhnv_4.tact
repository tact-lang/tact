struct LargeStruct {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: Int;
  f: Bool;
  g: Int;
  h: Bool;
  i: Int;
  j: Bool;
  k: Int;
  l: Bool;
  m: Int;
  n: Bool;
}

contract TestContract {
  data: LargeStruct;

  init() {
    self.data = LargeStruct{
      a: 1, b: false, c: 2, d: true, e: 3, f: false, g: 4, h: true, i: 5, j: false, k: 6, l: true, m: 7, n: false
    };
  }
}