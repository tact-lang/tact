struct OptiInner {
    number: Int?;
    name: String?;
}

contract TestContract {
    data: OptiInner?;

    init() {
        self.data = null;
    }
}