message(123) M {
    foo: Int;
}

contract TestContract {
    m: M? = null;

    init() {
        self.m = null;
    }

    receive() {
        let _ = self.m;
    }
}