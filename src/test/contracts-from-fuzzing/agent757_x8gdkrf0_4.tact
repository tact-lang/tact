struct Inner { v: Int; }
struct Middle { inner: Inner; }
struct Outer { middle: Middle; }

contract TestContract {
    persist: Outer?;

    init() {
        self.persist = null;
    }
}