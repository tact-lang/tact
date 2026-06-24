struct DeepNested {
    x: Int;
    y: Bool;
}

struct MidNested {
    inner: DeepNested;
    flag: Bool;
}

struct TopStruct {
    mid: MidNested;
    count: Int;
}

contract DeepNestedContract {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            mid: MidNested{
                inner: DeepNested{x: 10, y: true},
                flag: false
            },
            count: 42
        };
    }
}