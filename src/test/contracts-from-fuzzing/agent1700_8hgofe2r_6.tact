struct OptStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{ a: null, b: true, s: null };
    }
}