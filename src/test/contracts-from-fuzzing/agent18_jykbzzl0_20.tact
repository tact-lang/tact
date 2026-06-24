contract Test {
    const customId: Int = 16384 + 42;
    
    // Getter with explicit method ID
    get(self.customId) fun explicitGetter(): Int {
         return 100;
    }

    receive() {}
}
