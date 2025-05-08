contract Test {
    x: Int = 42;

    receive() {}

    get fun get_x(): Int {
         return self.x;
    }
}
