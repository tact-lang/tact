struct DefaultsOpts {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract NullInStructImplicit {
    data: DefaultsOpts;

    init() {
        self.data = DefaultsOpts{};
    }
}