contract Test {
    x: Int = 42;

    get fun getX(): Int {
        return self.x;
    }

    receive() {
        let value = self.getX();
    }
}
