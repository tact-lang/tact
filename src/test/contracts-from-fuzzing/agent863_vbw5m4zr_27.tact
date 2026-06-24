struct SS {
    x: Int;
}

contract OptDeep {
    x: SS?;

    init() {
        self.x = null;
    }
}