struct EmptyOptional {
    foo: Int?;
}

contract DefaultStructOpt {
    bar: EmptyOptional;

    init() {
        self.bar = EmptyOptional{ foo: null };
    }
}
