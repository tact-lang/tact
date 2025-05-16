struct Point {
    x: Int;
    y: Int;
}

contract OptStructContract {
    pos: Point?; 

    init() {
        self.pos = null;
    }
}