struct Flat {
  a: Int;
  b: Bool;
  c: String;
}

struct Nested1 {
  x: Flat;
  y: Bool;
}

struct Nested2 {
  z: Nested1;
}

struct Nested3 {
  w: Nested2;
}

contract NestedManyLevels {
  deep: Nested3;

  init() {
    self.deep = Nested3{
      w: Nested2{
        z: Nested1{
          x: Flat{
            a: 5,
            b: true,
            c: "hey"
          },
          y: false
        }
      }
    };
  }
}
