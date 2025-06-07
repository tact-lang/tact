struct Base {
    id: Int as uint8;
    content: String;
}

struct Rich {
    base: Base;
    count: Int as uint32;
    optText: String?;
    flag: Bool;
    optFlag: Bool?;
}

contract RichStructTest {
    val: Rich;

    init() {
        self.val = Rich{
            base: Base{ id:77, content:"hi" },
            count: 256,
            optText: null,
            flag: true,
            optFlag: null
        };
    }
}