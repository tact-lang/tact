struct InnerMost {
    value: Int;
    flag: Bool;
}

struct Middle {
    text: String;
    detail: InnerMost;
}

struct Outer {
    id: Int;
    content: Middle;
}

contract Chain {
    data: Outer;
    init() {
        self.data = Outer{
            id: 123,
            content: Middle{
                text: "hello",
                detail: InnerMost{ value: 5, flag: true }
            }
        };
    }
}