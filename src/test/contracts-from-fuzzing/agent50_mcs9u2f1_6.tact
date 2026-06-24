trait X {
    abstract const a: Int;
}

contract Y() with X {
    override const a: Int = 42;
    receive() {
        dump(self.a);
    }
}
