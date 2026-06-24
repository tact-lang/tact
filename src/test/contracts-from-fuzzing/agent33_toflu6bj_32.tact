struct Inner { x: Int; }
struct Wrap { inner: Inner?; }

contract TestContract {
    optWrap: Wrap?;

    init() {
        self.optWrap = null;
    }
}