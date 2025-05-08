struct NestedS1 {
    val: Int;
}

struct NestedS2 {
    first: NestedS1;
    second: NestedS1;
}

contract MultipleNestedSameType {
    nested: NestedS2;
    init() {
        self.nested = NestedS2{
            first: NestedS1{val:1},
            second: NestedS1{val:2}
        };
    }
}