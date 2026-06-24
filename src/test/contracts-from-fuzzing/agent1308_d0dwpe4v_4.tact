struct Base {
    id: Int;
}

struct Wrap1 {
    base: Base;
}

struct Wrap2 {
    wrap1: Wrap1;
}

struct Wrap3 {
    wrap2: Wrap2;
}

contract DeepWrap {
    nested: Wrap3;

    init() {
        self.nested = Wrap3{
            wrap2: Wrap2{
                wrap1: Wrap1{
                    base: Base{ id: 77 }
                }
            }
        };
    }
}