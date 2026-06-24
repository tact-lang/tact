struct NullableNest {
    sub1: SubOne?;
    sub2: SubTwo?;
}

struct SubOne {
    x: Int;
}

struct SubTwo {
    y: Bool;
}

contract NullNester {
    f: NullableNest;
    init() {
        self.f = NullableNest{
            sub1: null,
            sub2: SubTwo{y:true}
        };
    }
}