struct Data {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract NullableDataTop {
    f: Data?;

    init() {
        self.f = Data{ s:null, b:null, i:null };
    }
}