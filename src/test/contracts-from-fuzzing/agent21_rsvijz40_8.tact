contract TestGetterModification {
    counter: Int = 0;

    get fun getAndIncrement() : Int {
        self.counter = self.counter + 1;
        return self.counter;
    }

    fun readCounter() : Int {
        return self.counter;
    }

    receive() {}
}
