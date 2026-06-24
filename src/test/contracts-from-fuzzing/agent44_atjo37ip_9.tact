contract TestMod {
    x: Int = 0;

    receive() {}

    get fun modify(): Int {
        self.x += 1;
        return self.x;
    }
}
