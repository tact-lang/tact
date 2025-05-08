contract TestDefaultState {
    counter: Int = 0;

    receive() {}

    get fun getCounter(): Int {
         return self.counter;
    }
}
