contract TestDefault2 {
    x: Int = 0; // explicitly initializing

    receive() {}

    get fun default_x(): Int {
        return self.x;
    }
}
