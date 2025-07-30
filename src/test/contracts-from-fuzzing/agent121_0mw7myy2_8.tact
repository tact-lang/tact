struct Inner {
    answer: Int = 42;
}

struct Container {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
}

contract MultipleNestedSame {
    field: Container;
    
    init() {
        self.field = Container{
            nested1: Inner{answer:1},
            nested2: Inner{answer:2},
            nested3: Inner{answer:3},
        };
    }
}