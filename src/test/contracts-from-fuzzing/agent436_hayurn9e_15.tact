struct OptInner { value: Int?; }
struct Outer { inner: OptInner; }

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ inner: OptInner{ value: null } };
    }
}
