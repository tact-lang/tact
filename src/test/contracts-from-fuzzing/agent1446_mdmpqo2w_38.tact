struct Container {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Persist {
    foo: Container;

    init() {
        self.foo = Container{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
