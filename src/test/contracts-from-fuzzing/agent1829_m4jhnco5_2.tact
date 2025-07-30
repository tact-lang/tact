struct Inner { val: Int?; }
struct Outer { inner: Inner; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ val: null } };
    }
}