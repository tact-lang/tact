// test serialization customizations in deeply nested
struct Bottom {
    foo: Int as uint32;
    bar: Bool;
}

struct MidCustom {
    nested: Bottom;
    text: String;
}

struct TopMost {
    data: MidCustom;
}

contract TestSerializeNested {
    field: TopMost;

    init() {
        self.field = TopMost{
            data: MidCustom{
                nested: Bottom{foo: 255, bar: true},
                text: "hi"
            }
        };
    }
}
