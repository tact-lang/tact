struct DefaultAndOpt {
    foo: Int?;
    bar: Bool = true;
}

contract DefaultsAndOptionals {
    state: DefaultAndOpt;

    init() {
        self.state = DefaultAndOpt{ foo:null };
    }
}
