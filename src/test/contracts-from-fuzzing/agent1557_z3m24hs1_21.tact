struct OuterMost {
    a: Int; 
    nested: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract OutOfOrderTest {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            a: 1,
            nested: InnerMost{ value: 2 }
        };
    }
}