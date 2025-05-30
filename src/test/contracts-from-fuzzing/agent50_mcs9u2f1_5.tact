trait T1 {
    fun f(): Int {
        return 10;
    }
}

contract C() with T1 {
    receive() {
        dump(self.f());
    }
}
