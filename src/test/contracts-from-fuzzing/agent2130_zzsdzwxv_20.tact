message(77) Data {
    info: Int;
}

contract Test {
    m: Data?;

    init() {
        self.m = Data{ info: 123 };
    }
}