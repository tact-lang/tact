// Contract with multiple nested structs, mix of options, defaults, over 10 fields total
struct Inner1 {
 a: Int;
 b: Bool;
}

struct Inner2 {
 c: String?;
 d: Bool?;
}

struct Inner3 {
 e: Int?;
 f: Int;
}

struct Outer {
 x: Inner1;
 y: Inner2;
 z: Inner3;
 text: String;
 flag: Bool;
 num: Int;
}

contract ManyNestedCombo {
 state: Outer;

 init() {
  self.state = Outer {
    x: Inner1{ a:1, b:true },
    y: Inner2{ c:null, d:null },
    z: Inner3{ e:null, f:2 },
    text: "ok",
    flag: false,
    num: 42
  };
 }
}