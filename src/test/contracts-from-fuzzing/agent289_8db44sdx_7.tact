struct Data {
    val: Int = 5;
}

contract TestContract {
    optData: Data?;

    init() {
        self.optData = Data{};
    }

    receive() {}
}