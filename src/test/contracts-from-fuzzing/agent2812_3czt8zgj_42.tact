struct TopNested {
    innermost: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool?;
}

contract TestOrder {
    data: TopNested;

    init() {
        self.data = TopNested{
            innermost: InnerStruct{ x: 123, y: null }
        };
    }
}