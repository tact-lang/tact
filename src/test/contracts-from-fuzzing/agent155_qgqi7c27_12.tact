contract StructFieldDefaults {
    s: Data;
    init() {
        self.s = Data{};
    }
}

struct Data {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
}