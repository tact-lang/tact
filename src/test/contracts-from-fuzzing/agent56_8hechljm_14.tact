contract DefaultTest {
    counter: Int = 0;

    receive() {}

    get fun getCounter(): Int {
        return self.counter; // returns default value 0
    }
}
