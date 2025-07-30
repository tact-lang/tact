struct Nested {
  x: Int;
}

struct Container {
  n1: Nested;
  n2: Nested;
  n3: Nested;
}

contract MultiNested {
    content: Container;
    init() {
        self.content = Container{
            n1: Nested{ x: 1 },
            n2: Nested{ x: 2 },
            n3: Nested{ x: 3 }
        };
    }
}
