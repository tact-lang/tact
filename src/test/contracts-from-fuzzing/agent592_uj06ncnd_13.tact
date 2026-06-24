struct Nested1 {
  val: Int;
  flag: Bool;
}

struct Nested2 {
  first: Nested1;
  second: Nested1;
  comment: String;
}

contract Combo {
  a: Int;
  b: Bool;
  s: String;
  nested: Nested2;

  init() {
    self.a = 5;
    self.b = true;
    self.s = "ok";
    self.nested = Nested2{
      first: Nested1{val:1, flag:false}, 
      second: Nested1{val:2, flag:true},
      comment: "done"
    };
  }
}