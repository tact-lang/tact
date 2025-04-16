extends mutates fun hippityHoppity(self: Int) {
    self += 1;
}

contract TestExtensionMutation() {
    fun test() {
        let a: Int = 10;
        a.hippityHoppity();
        dump(a); // expected output: 11
    }
    receive() {
        self.test();
    }
}
