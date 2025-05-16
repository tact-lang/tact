struct BoolInner {
    flag: Bool;
}

struct BoolOuter {
    nested: BoolInner;
}

contract BoolNestTest {
    state: BoolOuter;

    init() {
        self.state = BoolOuter{
            nested: BoolInner{ flag:true }
        };
    }
}