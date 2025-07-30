struct OuterRef {
    i: Int;
    inner: InnerRef;
}

struct InnerRef {
    i: Int;
}

contract RefOrderTest {
    val: OuterRef;

    init() {
        self.val = OuterRef{i:1, inner: InnerRef{i:2}};
    }
}