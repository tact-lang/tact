struct NestedDeep {
    sub: NestedMid;
}

struct NestedMid {
    leaf: NestedLeaf;
}

struct NestedLeaf {
    value: Int;
}

contract MultiLevel {
    field: NestedDeep;

    init() {
        self.field = NestedDeep{
            sub: NestedMid{ leaf: NestedLeaf{ value: 123 } }
        };
    }
}