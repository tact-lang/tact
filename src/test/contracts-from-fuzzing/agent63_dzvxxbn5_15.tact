contract TestDefaultState {
    x: Int = 0;

    receive() {}

    get fun getX(): Int {
        return self.x;
    }
}
