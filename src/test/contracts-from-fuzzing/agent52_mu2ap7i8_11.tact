contract TestDefaultStateGetter {
    // Providing an explicit default value
    counter: Int = 0;

    receive() {}

    // Getter returning the default state (counter)
    get fun getCounter(): Int {
        return self.counter;
    }
}
