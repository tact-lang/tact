struct Data {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    d: Data;
    init() {
        self.d = Data{
            a: null,
            b: null,
            c: null
        };
    }
}