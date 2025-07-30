struct OptStruct {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptStructStorage {
    data: OptStruct;

    init() {
        self.data = OptStruct{};
    }
}