struct OptNestedInner { val: Bool?; }
struct OptNestedOuter { inner: OptNestedInner?; }

contract OptNestedTest {
    data: OptNestedOuter;

    init() {
        self.data = OptNestedOuter{
            inner: null
        };
    }
}