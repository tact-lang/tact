struct Inner { val: Int; }

struct Outer { inner: Inner?; flag: Bool; }

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: null,
            flag: true,
        };
    }
}