contract DebugVoid {
    fun noReturn() { }
    
    receive() {
        dump(self.noReturn());
    }
}
