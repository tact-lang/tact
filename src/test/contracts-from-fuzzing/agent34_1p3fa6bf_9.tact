struct Data {
    s: String?;
    n: Int?;
}

contract Test8 {
    d: Data;
    init() {
        self.d = Data{ s: null, n: 42 };
    }
}