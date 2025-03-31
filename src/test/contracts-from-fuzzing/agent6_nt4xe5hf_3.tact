contract Test {
    counter: Int = 0;

    get fun inc() : Int {
        self.counter = self.counter + 1;
        return self.counter;
    }
}
