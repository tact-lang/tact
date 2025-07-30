struct OptInner { a: Int?; flag: Bool; }
struct OptOuter { inner: OptInner?; num: Int; }

contract NestedOptionalTest {
    data: OptOuter;

    init() {
        self.data = OptOuter{ inner: null, num: 1 };
    }
}
