struct Small {
  a: Int;
}

struct NestedOptional {
  inner: Small?;
}

struct MiddleOptional {
  nested: NestedOptional?;
}

struct TopOptional {
  mid: MiddleOptional?;
}

contract TestContract {
    root: TopOptional;

    init() {
        self.root = TopOptional{
            mid: MiddleOptional{
                nested: NestedOptional{
                    inner: null
                }
            }
        };
    }
}