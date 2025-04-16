contract TestDefault {
    counter: Int = 100;

    receive() {}

    get fun getCounter(): Int {
         return self.counter;
    }
}
