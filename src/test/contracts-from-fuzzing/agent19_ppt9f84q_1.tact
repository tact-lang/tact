contract Test {
    state: Int = 42;
    receive() {}
    get fun getInt(): Int {
       return self.state;
    }
}
