struct Rectangle {
    a: Int = 0;
    b: Int = 0;
}

contract OptStructField {
    r: Rectangle?;

    init() {
        self.r = null;
    }
}