struct Large {
  a: Int;
  b: Bool;
  c: String;
  d: Int = 1;
  e: Bool?; 
  f: String = "str";
  g: Int;
  h: Bool = false;
  i: String?; 
  j: Int;
  k: Bool?; 
  l: String = "l";
  m: Int = 0;
  n: Bool = true;
  o: String?;
}

contract TestContract {
  storage: Large;

  init() {
    self.storage = Large{
      a: 10,
      b: true,
      c: "c",
      d: 2,
      e: false,
      f: "f",
      g: 7,
      h: true,
      i: null,
      j: 99,
      k: true,
      l: "lval",
      m: 6,
      n: false,
      o: "hello"
    };
  }
}