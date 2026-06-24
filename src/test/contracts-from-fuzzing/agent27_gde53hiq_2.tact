struct Data {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: Data;

    init() {
        self.data = Data{a: null, b: true, c: "hello"};
    }
}