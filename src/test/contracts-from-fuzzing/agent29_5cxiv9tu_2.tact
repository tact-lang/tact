contract Test {
    x: Int = 5;

    get fun getPrimitive(): Int {
        return self.x;
    }

    receive() {
        self.getPrimitive();
    }
}
