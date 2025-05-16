contract StateTryCatch {
    // Persistent state variable
    x: Int;

    init() {
        self.x = 0;
        try {
            self.x = 100;  // Modify state in try block
            // Force an error with throw
            throw(101);
        } catch (err) {
            // In catch, the changes made in try block should be rolled back
            // So self.x is still 0. Now add 1 to it.
            self.x = self.x + 1;
        }
    }

    // Getter to check the persistent state variable
    get fun getX(): Int {
        return self.x;
    }
}
