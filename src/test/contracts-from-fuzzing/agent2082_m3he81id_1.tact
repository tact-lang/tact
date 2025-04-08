struct NestedInner {
    flag: Bool;
    num: Int;
}

struct NestedOuter {
    info: NestedInner;
    label: String;
}

contract DeepStorage {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            info: NestedInner{
                flag: true,
                num: 123,
            },
            label: "test",
        };
    }
}
