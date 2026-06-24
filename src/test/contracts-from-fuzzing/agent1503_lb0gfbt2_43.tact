contract SerOptPersistent {
    x: Int? as uint8;

    init() { self.x = null; }
    receive() {}
}