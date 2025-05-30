struct NestedWithOptionalInner {
    inner: Int?;
    flag: Bool;
}

struct TopLevel {
    nested: NestedWithOptionalInner;
    desc: String;
}

contract NestedOptionalContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            nested: NestedWithOptionalInner{ inner: null, flag: true },
            desc: "hello"
        };
    }

    receive() {
        self.data = self.data;
    }
}