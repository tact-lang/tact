struct DeeplyNested {
    i: Int;
}

struct Wrapped1 {
    nested: DeeplyNested;
}

struct Wrapped2 {
    nested: Wrapped1;
}

struct Wrapped3 {
    nested: Wrapped2;
}

contract VeryDeepNestingContract {
    data: Wrapped3;
    init() {
        self.data = Wrapped3{
            nested: Wrapped2{
                nested: Wrapped1{
                    nested: DeeplyNested{ i: 42 }
                }
            }
        };
    }
}