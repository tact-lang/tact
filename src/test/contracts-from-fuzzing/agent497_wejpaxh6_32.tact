struct BigNested {
  a: Int;
  b: Int? = 5;
  c: String = "c";
  d: Bool?;
  e: Inner1;
  f: Inner1?;
}

struct Inner1 {
  x: Int = 42;
  y: Inner2?;
}

struct Inner2 {
  s: String? = "sss";
}

contract TestContract {
  big: BigNested;

  init() {
    self.big = BigNested{
      a:1,
      d:true,
      e: Inner1{ y: Inner2{} },
      f: null
    };
  }
}