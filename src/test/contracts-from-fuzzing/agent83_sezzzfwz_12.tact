struct EmptyNested {
    v: Int;
}

struct Container {
    nested1: EmptyNested;
    nested2: EmptyNested;
    nested3: EmptyNested;
    nested4: EmptyNested;
}

contract MultiNested {
    val: Container;

    init() {
        self.val = Container{
            nested1: EmptyNested{v:1},
            nested2: EmptyNested{v:2},
            nested3: EmptyNested{v:3},
            nested4: EmptyNested{v:4}
        };
    }
}