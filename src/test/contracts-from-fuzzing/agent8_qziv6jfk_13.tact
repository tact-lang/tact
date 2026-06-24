contract TestGetterDefault {
    counter: Int = 0; // explicitly set default

    receive() {}

    get fun getCounter(): Int {
        return self.counter;
    }
}
