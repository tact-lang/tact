struct Inner { foo: Int? }
struct Mid { inner: Inner? }
contract TestContract {
    data: Mid;
    init() { self.data = Mid{ inner: null }; }
}