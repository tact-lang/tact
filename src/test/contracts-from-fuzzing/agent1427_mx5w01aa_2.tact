struct Inner {
    a: Int;
}

contract TestContract {
    nested: Inner = Inner{ a: 1 };
    receive() {
        let _ = self.nested;
    }
}