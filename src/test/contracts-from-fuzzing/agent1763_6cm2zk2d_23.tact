struct ChainNested {
    a: Nested1;
}

struct Nested1 {
    b: Nested2?;
}

struct Nested2 {
    c: Nested3?;
}

struct Nested3 {
    val: Int?;
}

contract TestContract {
    prop: ChainNested;

    init() {
        self.prop = ChainNested{
            a: Nested1{b: null}
        };
    }
}