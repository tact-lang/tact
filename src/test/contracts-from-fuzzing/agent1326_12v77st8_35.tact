struct A {
  x: Int?;
}

struct B {
  y: A?;
}

contract NestedOptionalStructs {
    root: B;
    init() {
        self.root = B{
            y: null
        };
    }
}