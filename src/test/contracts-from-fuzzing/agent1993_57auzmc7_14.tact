struct Wrapped {
    inner: Int?;
}

contract TestContract {
    wrap: Wrapped?;

    init() {
        self.wrap = null;
    }
}