contract TestPrimitiveGetter {
    state: Int = 42;

    receive() {}

    get fun getState() : Int {
        return self.state;
    }
}
