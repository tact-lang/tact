struct EmptyTrailingOptional {
    a: Int;
    b: Bool?;
}

contract OptionalAsLast {
    data: EmptyTrailingOptional;

    init() {
        self.data = EmptyTrailingOptional{
            a: 42,
            b: null
        };
    }
}