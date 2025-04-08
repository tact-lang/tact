struct NestedLevel2 {
    a: Int;
    b: String?;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    c: Bool;
}

struct TopLevel {
    nested: NestedLevel1;
    d: Int;
    e: String?;
}

contract NestedFields {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            nested: NestedLevel1{
                inner: NestedLevel2{
                    a: 10,
                    b: null
                },
                c: true
            },
            d: 5,
            e: "hello"
        };
    }
}