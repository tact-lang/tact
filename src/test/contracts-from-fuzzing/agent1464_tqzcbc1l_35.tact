struct InnerNested {
    x: Int? = 5;
    y: Int?;
}

contract TestContract {
    record: InnerNested?;

    init() {
        self.record = null;
    }
}