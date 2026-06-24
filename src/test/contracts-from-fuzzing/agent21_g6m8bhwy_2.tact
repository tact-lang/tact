contract TestGetter {
    x: Int = 0;

    // Getter that modifies state variables at runtime, though changes won't persist
    get fun modifyGetter(): Int {
         self.x = self.x + 1;
         return self.x;
    }

    // A normal getter that only reads the state
    get fun readGetter(): Int {
         return self.x;
    }
}
