struct Inner {
    a: Int;
    b: Bool;
    c: Int?;
}

contract TestContract {
    value: Inner;

    init() {
        self.value = Inner{
            a: 1,
            b: true,
            c: null,
        };
    }
}