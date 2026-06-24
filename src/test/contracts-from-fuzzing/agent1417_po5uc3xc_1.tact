struct DeeplyNested {
    val: Int;
    child: Nested1;
}

struct Nested1 {
    next: Nested2;
}

struct Nested2 {
    more: Nested3;
}

struct Nested3 {
    data: Int?;
}

contract TestContract {
    state: DeeplyNested;
    init() {
        self.state = DeeplyNested{
            val: 1,
            child: Nested1{
                next: Nested2{
                    more: Nested3{
                        data: 42
                    }
                }
            }
        };
    }
}
