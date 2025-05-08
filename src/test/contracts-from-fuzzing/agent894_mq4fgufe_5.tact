struct Nested1 {
    value1: Int;
}

struct Nested2 {
    ns1: Nested1;
    value2: Int;
}

struct Nested3 {
    ns2: Nested2;
    value3: Int;
}

contract MultiLevelNested {
    field: Nested3;

    init() {
        self.field = Nested3{
            ns2: Nested2{
                ns1: Nested1{
                    value1: 1
                },
                value2: 2
            },
            value3: 3
        };
    }
}