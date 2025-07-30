struct Base {
    x: Int = 0;
    y: Bool = false;
}

contract OptStructField {
    info: Base?;

    init() {
        self.info = null;
    }

    receive() {}
}