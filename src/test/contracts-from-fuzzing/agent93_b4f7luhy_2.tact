contract TestPrimitive {
    state: Int = 42;

    receive() {}

    get fun getValue(): Int {
         return self.state;
    }
}
