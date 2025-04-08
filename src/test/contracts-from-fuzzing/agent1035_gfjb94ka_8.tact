struct OptionalNestInner { x: Int? }
struct OptionalNestOuter { inner: OptionalNestInner? }

contract OptNestTest {
    data: OptionalNestOuter = OptionalNestOuter{ inner: null };
    init() {
        self.data = OptionalNestOuter{ inner: OptionalNestInner{ x: 42 } };
    }
    receive() {}
}