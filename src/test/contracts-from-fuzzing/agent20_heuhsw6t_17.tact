extends mutates fun hippityHoppity(self: Int) {
    // Increment the integer 'self' by one
    self += 1;
}

contract TestMutatesExtension {
    fun showcase() {
        let x: Int = 10;
        // Calling the mutating extension function on x
        x.hippityHoppity();
        // After mutation, x is expected to be 11
        dump(x);
    }

    receive() {
        self.showcase();
    }
}
