extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMutate(counter: Int) {
    // Here, 'counter' is the persistent state variable (contract parameter)
    receive() {
        self.counter.inc();
        // Forward remaining value back to sender
        cashback(sender());
    }
    
    get fun testCounter(): Int {
        return self.counter;
    }
}
