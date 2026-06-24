message(0x4) Base {}

message(0x5) Derived {}

struct UnionWrap {
    b: Base;
    d: Derived;
}

contract MultipleEmptyMessages {
    u: UnionWrap;
    init() {
        self.u = UnionWrap{ b: Base{}, d: Derived{} };
    }
}