extends mutates fun hippityHoppity(self: Int) {
    self += 1;
}

contract TestExtensionMutate() {
    fun test() {
        let a: Int = 10;
        a.hippityHoppity();
        dump(a); // Expected output: 11
    }

    receive() { self.test(); }
}
