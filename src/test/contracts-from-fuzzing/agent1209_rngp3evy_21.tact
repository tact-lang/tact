struct Plain {
    x: Int;
    y: String;
}

contract UsePlain {
    data: Plain;
    init() {
        self.data = Plain{x: 42, y: "text"};
    }
}