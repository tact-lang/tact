// edge case: large struct with mixed optional, primitive, and nested structs
struct P { i: Int; }

struct Q {
 x: Int;
 y: Bool?;
 z: P;
 name: String;
 opt: Int?;
}

contract Mix {
 q: Q = Q{
  x:1,
  y:null,
  z:P{i:5},
  name:"hello",
  opt:null
 };
}
