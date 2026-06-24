contract GetterModifies {
    i: Int = 1;
    receive() {}
    
    // Getter that attempts to modify state; modifications are not persisted
    get fun inc(): Int {
         self.i += 1;
         return self.i;
    }
}
