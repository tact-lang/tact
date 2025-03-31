contract TestDefaultState {
    y: Int? = null;

    receive() {}

    get fun getY(): Int? {
        return self.y;
    }
}
