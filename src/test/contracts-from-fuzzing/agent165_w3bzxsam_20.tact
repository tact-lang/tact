struct Inner { foo: Int?; bar: Bool }

struct Outer { inner: Inner?; num: Int }

contract Opts {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            num: 7
        };
    }
}