trait T1 {
    fun a(): Int { return 1; }
}

trait T2 with T1 {
    fun b(): Int { return self.a() + 1; }
}

contract C() with T2 {
    receive() {
        dump(self.b());
    }
}
