trait GetterT {
    // Abstract getter: inheriting contract must provide an implementation
    abstract get fun v(): Int;
}

contract GetterC() with GetterT {
    // Override the abstract getter; note that getters do not take parameters
    override get fun v(): Int {
        return 777;
    }

    receive() {
        // Access the getter value via method call
        let x = self.v(); // Expected: 777
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: x.toString().asComment()
        });
    }
}
