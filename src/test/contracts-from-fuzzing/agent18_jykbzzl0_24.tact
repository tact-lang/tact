contract Test {
    counter: Int = 10;
    
    receive() {}
    
    // Getter that modifies state (increments counter) — note: modifications are not persisted
    get fun incCounter(): Int {
         self.counter += 1;
         return self.counter;
    }
}
