struct BoolOption {
    foo: Bool?;
    bar: Bool?;
    baz: Bool?;
}

contract TestContract {
    data: BoolOption;
    init() {
        self.data = BoolOption{
            foo: null,
            bar: null,
            baz: true
        };
    }
}