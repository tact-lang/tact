struct Ab {
 a: Int;
 b: Bool;
}

struct Cd {
 c: String;
 d: Address;
}

struct Root {
 x: Ab;
 y: Cd;
}

contract TwoNest {
 root: Root;

 init() {
  self.root = Root{
      x: Ab{a:1, b:true},
      y: Cd{c:"1", d:myAddress()}
  };
 }
}