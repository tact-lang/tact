struct First {
  x: Int;
  y: Int;
}

struct Second {
  sub: First;
  opt: First?;
  b: Bool;
}

contract StructInsideStructWithOptional {
    data: Second;

    init() {
        self.data = Second{
            sub: First{x:1,y:2},
            opt: null,
            b: true
        };
    }
}