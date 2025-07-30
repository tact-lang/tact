struct Data {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructStorage {
    data: Data?;

    init() {
        self.data = Data{ a: 555, b: true, c: "hello" };
    }
}