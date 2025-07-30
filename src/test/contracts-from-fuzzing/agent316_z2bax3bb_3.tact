struct Data {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test {
    data: Data;

    init() {
        self.data = Data{
            a: null,
            b: null,
            c: null
        };
    }
}
