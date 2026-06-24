struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    o: OptStruct;
    init() {
        self.o = OptStruct{ a: null, b: true, c: null };
    }
}