struct InitializesToNull {
    foo: Int?;
    bar: String?;
}

contract NullStructDefault {
    s: InitializesToNull;

    init() {
        self.s = InitializesToNull{
            foo: null,
            bar: null
        };
    }
}