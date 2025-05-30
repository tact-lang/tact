struct Complex {
    x: Int;
    y: Int?;
    flag: Bool;
    text: String;
}

contract TestContract {
    data: Complex?;

    init() {
        self.data = null;
    }
}