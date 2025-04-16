struct Inner {
    a: Int;
    b: Bool;
}

contract NestedOptional {
    data: Inner?;

    init() {
        self.data = Inner{
            a: 42,
            b: true
        };
    }
}