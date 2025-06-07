struct HasOptional {
    foo: Int?;
}

contract OptionalNoInit {
    s: HasOptional;

    init() {
        self.s = HasOptional{ foo:null };
    }
}