contract Test {
    fun foo(): Int? {
        return null;
    }
    receive() {
        let x = self.foo()!!;
        dump(x);
    }
}
