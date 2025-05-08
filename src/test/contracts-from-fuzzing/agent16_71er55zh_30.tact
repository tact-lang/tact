struct X {
  a: Int?;
}

struct Y {
  b: X?;
}

contract NestedOptStructOpt {
    y: Y;

    init() {
        self.y = Y{ b: null };
    }
}