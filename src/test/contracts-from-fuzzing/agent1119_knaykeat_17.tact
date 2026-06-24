struct Bar {
    x: Int = 5;
    y: Bool = false;
    z: String = "";
}

contract OptStructNull {
    d: Bar?;

    init() {
        self.d = null;
    }
}