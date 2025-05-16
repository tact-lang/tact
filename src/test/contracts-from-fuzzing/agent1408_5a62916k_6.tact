struct DefaultAndOptional {
    a: Int = 11;
    b: Bool?;
    c: Int? = null;
    d: Bool = false;
}

contract TestContract {
    data: DefaultAndOptional;

    init() {
        self.data = DefaultAndOptional{
            a: 42,
            b: true,
            c: null,
            d: true,
        };
    }
}