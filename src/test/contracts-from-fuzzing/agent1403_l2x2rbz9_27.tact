struct First {
  value: Int;
}

struct Second {
  f: First;
  t: Int;
}

contract NestedMix {
    data: Second;

    init() {
        self.data = Second{
            f: First{ value: 7 },
            t: 8
        };
    }
}