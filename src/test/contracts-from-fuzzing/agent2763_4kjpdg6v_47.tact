struct A { a: Int }
struct B { b: Int }

struct Outer {
  sa: A?;
  sb: B?;
}

contract NullableStructs {
  x: Outer;

  init() {
    self.x = Outer{ sa:null, sb:null };
  }
}