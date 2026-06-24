struct Nested2 {
  i: Int;
  s: String;
}

struct Nested1 {
  x: Int;
  n2: Nested2;
}

struct TopLevel {
  flag: Bool;
  n1: Nested1;
}

contract ManyNestedStructures {
  obj: TopLevel;

  init() {
    self.obj = TopLevel{
      flag: true,
      n1: Nested1{
        x: 123,
        n2: Nested2{
          i: 999,
          s: "hello"
        }
      }
    };
  }
}