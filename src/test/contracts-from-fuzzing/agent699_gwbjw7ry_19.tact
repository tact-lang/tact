struct Data {
    field: Int = 5;
}

contract OptStructInit {
    data: Data?;

    init() {
        self.data = Data{};
    }
}
