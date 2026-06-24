fun test(): Int { return 42; }

contract TestContract {
    foo: Int = test();

    receive() {
        let _ = self.foo;
    }
}