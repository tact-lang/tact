struct ComboNestedOpt {
    id: Int;
    inner: InnerOpt;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract ComboTest {
    data: ComboNestedOpt = ComboNestedOpt{
        id: 1,
        inner: InnerOpt{ x: null, y: null }
    };

    receive() {
        self.data = ComboNestedOpt{
            id: 2,
            inner: InnerOpt{ x: 42, y: true }
        };
    }
}