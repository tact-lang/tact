struct Inner { val: Int }
struct Mid { inner: Inner? }
struct Outer { mid: Mid? }

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer { mid: Mid { inner: Inner { val: 77 } } };
    }
}