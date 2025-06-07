struct NestedOpt {
    x: Int?;
    y: Bool;
}

struct OuterStruct {
    inner: NestedOpt;
    num: Int;
}

contract Test {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: NestedOpt{ x: null, y: false },
            num: 10
        };
    }
}