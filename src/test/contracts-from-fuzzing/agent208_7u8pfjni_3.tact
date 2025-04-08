struct Nested1 {
    innerNested: Nested2;
    flag: Bool;
}

struct Nested2 {
    num: Int as uint32;
    text: String;
}

contract Test4 {
    v: Nested1;

    init() {
        self.v = Nested1{
            innerNested: Nested2{
                num: 11,
                text: "nested",
            },
            flag: false,
        };
    }
}