struct NestedOpt {
    foo: Int?;
    bar: Bool?;
    sub: SubStruct?;
}

struct SubStruct {
    x: Int;
    y: Bool?;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            foo: null,
            bar: true,
            sub: SubStruct{ x: 5, y: null }
        };
    }
}
