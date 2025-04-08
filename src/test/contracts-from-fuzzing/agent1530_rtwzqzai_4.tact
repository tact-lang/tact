struct HasOptionals {
    foo: Int?;
    bar: String?;
    flag: Bool?;
}

contract TestContract {
    data: HasOptionals;

    init() {
        self.data = HasOptionals{ foo: null, bar: null, flag: null };
    }
}
