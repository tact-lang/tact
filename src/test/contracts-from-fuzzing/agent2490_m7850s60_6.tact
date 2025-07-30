struct NestedStr {
    text: String;
}

struct Outer {
    nested: NestedStr;
    descr: String;
    optVal: Bool?;
}

contract StructsOfStringsTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: NestedStr{text: "foo"},
            descr: "bar",
            optVal: null,
        };
    }
}