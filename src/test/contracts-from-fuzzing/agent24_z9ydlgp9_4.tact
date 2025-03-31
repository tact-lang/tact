contract TestModifyGetter {
    v: Int = 5;
    
    receive() {}

    // Getter that modifies state (but modifications are not persisted after execution)
    get fun test(): Int {
        self.v += 1;
        return self.v;
    }
}
