struct OptInner { val: Int?; }
struct OptOuter { inner: OptInner?; }

contract OptTest {
    data: OptOuter;

    init() {
        self.data = OptOuter{
            inner: OptInner{ val: null }
        };
    }
}