contract Test1 {
    x: Int = 123;

    receive() {}

    get fun getX(): Int {
         return self.x;
    }
}
