struct TopStruct {
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    a: Int;
    b: String;
}

struct Nested2 {
    c: Bool;
    d: Address;
}

contract MultipleNestedTest {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            nested1: Nested1{ a: 1, b: "b" },
            nested2: Nested2{ c: true, d: myAddress() }
        };
    }
}
