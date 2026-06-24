contract TestUnderscore {
    state: Int = 0;
    
    receive(_: String) {
         // The parameter is discarded; its value is not used.
         self.state = 100;
    }
}
