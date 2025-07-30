struct LargeNested {
 a: Int;
 b: Nested1;
 c: Nested2;
}

struct Nested1 {
 x: Int;
 y: Int;
 z: Int;
}

struct Nested2 {
 s: String;
 t: Bool;
}

contract TestContract {
 data: LargeNested;

 init() {
  self.data = LargeNested{
    a: 1,
    b: Nested1{ x: 2, y: 3, z:4 },
    c: Nested2{ s: "hi", t: true }
  };
 }
}