struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: Inner = Inner{ a: 1, b: true, c: "hello" };

    receive() {
        let _ = self.data.a;
    }
}