struct Mix {
    foo: Int;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    store: Mix;

    init() {
        self.store = Mix{
            foo: 123,
            bar: null,
            baz: null
        };
    }
}