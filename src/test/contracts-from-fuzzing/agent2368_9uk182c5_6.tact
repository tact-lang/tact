struct Sub {
    a: Int;
    b: Bool = true;
    c: String?;
}

contract DefaultsOptional {
    inner: Sub;

    init() {
        self.inner = Sub{
            a: 99,
            c: null
        };
    }
}