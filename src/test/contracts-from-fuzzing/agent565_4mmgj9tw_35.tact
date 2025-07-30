struct NestedOne {
    foo: Int;
}
struct NestedTwo {
    bar: NestedOne;
}
struct NestedThree {
    baz: NestedTwo;
}

contract ChainNest {
    deep: NestedThree;
    init() {
        self.deep = NestedThree{
            baz: NestedTwo{
                bar: NestedOne{ foo: 11 },
            },
        };
    }
}