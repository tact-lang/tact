struct Data {
    x: Int;
    y: Bool;
}

contract OptContract {
    optData: Data? = null;

    receive() {
        self.optData = Data{ x: 5, y: true };
    }
}
