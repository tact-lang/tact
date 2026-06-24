struct HasOptional {
    foo: Int?;
}

contract OptWithDefault {
    val: HasOptional = HasOptional{ foo: null };
    init() {
        self.val = HasOptional{ foo: 33 };
    }
}
