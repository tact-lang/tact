struct NestedInner {
    flag: Bool;
    text: String;
}

struct NestedOuter {
    count: Int;
    detail: NestedInner;
    note: String?;
}

contract DeepNestedTest {
    info: NestedOuter;
    
    init() {
        self.info = NestedOuter{
            count: 7,
            detail: NestedInner{
                flag: true,
                text: "hello"
            },
            note: null
        };
    }
}