struct DeepInner {
    xi: Int;
    yi: Int;
}

struct Inner {
    optDeep: DeepInner?;
    flag: Bool;
}

contract DeepNestedTest {
    data: Inner;    
    init() {
        self.data = Inner{ optDeep: null, flag: true };
    }
}