struct SerialInner {
    x: Int as uint32;
    y: Int;
}

contract SerialNested {
    saved: SerialInner;

    init() {
        self.saved = SerialInner{ x: 255, y: -1 };
    }

    receive() {
        let _ = self.saved.x + self.saved.y;
    }
}