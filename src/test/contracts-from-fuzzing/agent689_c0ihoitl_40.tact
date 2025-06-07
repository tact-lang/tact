struct InnerOptSer {
    x: Int? as uint16;
}

struct OuterWrap {
    inner: InnerOptSer;
}

contract NestedOptSerializationTest {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{
            inner: InnerOptSer{ x: null },
        };
    }
}