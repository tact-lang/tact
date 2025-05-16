struct DefaultOptional {
    foo: Int?;
}

contract DefaultOptionalContract {
    st: DefaultOptional;

    init() {
        self.st = DefaultOptional{
            foo: null
        };
    }
}
