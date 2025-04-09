struct OptData {
    a: Int;
    b: Bool;
}

contract OptStructContract {
    data: OptData?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = OptData{ a: 999, b: true };
    }
}