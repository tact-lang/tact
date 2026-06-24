struct Data {
    x: Int = 0;
    y: Int = 0;
}

contract Store {
    data: Data;

    init() {
        self.data = Data{};
    }

    receive() {}
}