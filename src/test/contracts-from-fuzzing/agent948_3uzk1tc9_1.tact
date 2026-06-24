struct InnerNested {
    flag: Bool;
    comment: String;
    count: Int;
}

struct OuterNested {
    inner: InnerNested;
    amount: Int;
    description: String;
}

contract NestedStructTest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            inner: InnerNested{
                flag: true,
                comment: "abc",
                count: 777,
            },
            amount: 9999,
            description: "desc"
        };
    }
}