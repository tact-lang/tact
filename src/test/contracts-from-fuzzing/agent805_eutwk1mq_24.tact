struct Data {
    a: Int = 5;
    b: Bool = true;
}

contract TestContract {
    field: Data?;

    init() {
        self.field = null;
    }
}