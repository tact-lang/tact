struct HasDefault {
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "hello";
}

contract TestContract {
    defaults: HasDefault;

    init() {
        self.defaults = HasDefault{};
    }
}