struct Nested1 {
 a: Int;
}

struct Nested2 {
 b: Nested1;
}

struct Nested3 {
 c: Nested2;
}

struct Nested4 {
 d: Nested3;
}

contract StorageTree {
 root: Nested4;
 init() {
  self.root = Nested4{ d: Nested3{ c: Nested2{ b: Nested1{ a: 42 } } } };
 }
}