struct DefaultOpt {
    foo: Int?;
    bar: Bool?;
}

contract DefaultsOptionals {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{ foo: null, bar: null };
    }
}