struct OptInner {
    val: Int?;
}

contract TestContract {
    data: OptInner?;

    init() {
        self.data = null;
    }
}