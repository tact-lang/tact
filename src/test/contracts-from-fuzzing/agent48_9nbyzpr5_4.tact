trait Base {
    fun foo(): Int {
        return 5;
    }
}

trait A with Base {}

trait B with Base {}

contract C() with A, B {
    receive() {
        let x = self.foo();
        dump(x);
    }
}
