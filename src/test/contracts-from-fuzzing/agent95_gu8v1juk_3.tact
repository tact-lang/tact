struct Data {
    value: Int;
    ok: Bool;
}

contract TestContract {
    info: Data?;

    init() {
        self.info = Data{ value: 5, ok: true };
    }
}